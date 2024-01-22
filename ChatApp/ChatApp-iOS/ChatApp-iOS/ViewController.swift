//
//  ViewController.swift
//  ChatApp-iOS
//
//  Created by 홍성준 on 1/22/24.
//

import UIKit

final class ViewController: UIViewController {
    
    private var ws: URLSessionWebSocketTask?
    private let url = URL(string: "ws://localhost:8080/echo")!
    private let id = UUID()
    private let chatTextField = UITextField()
    private let tableView = UITableView()
    private var models: [CellModel] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        requestNickName()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        chatTextField.delegate = self
        chatTextField.borderStyle = .line
        chatTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chatTextField)
        
        tableView.contentInset = .init(top: 2000, left: 0, bottom: 0, right: 0)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            chatTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            chatTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            chatTextField.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: chatTextField.topAnchor),
        ])
    }
    
    private func requestNickName() {
        let controller = UIAlertController(title: "닉네임", message: "닉네임을 입력해주세요", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "저장", style: .default) { [unowned self] action in
            connect(name: controller.textFields?[0].text ?? "unknown")
        }
        controller.addTextField()
        controller.addAction(okAction)
        present(controller, animated: true)
    }
    
    private func connect(name: String) {
        let session = URLSession(configuration: .default)
        let webSocket = session.webSocketTask(with: url)
        ws = webSocket
        webSocket.resume()
        let connect = Connect(name: name)
        send(data: connect)
        receive()
    }
    
    private func chat(message: String) {
        let chat = Chat(message: message, date: .init())
        send(data: chat)
        append(message: message, isPeer: false)
    }
    
    private func receive() {
        ws?.receive { [unowned self] result in
            switch result {
            case .success(let message):
                switch message {
                case .data(let data):
                    if let chat = try? JSONDecoder().decode(Chat.self, from: data) {
                        append(message: chat.message, isPeer: true)
                    }
                    
                case .string(let string):
                    print("# PONG: \(string)")
                    
                @unknown default:
                    return
                }
                
                receive()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    private func send<T: Codable>( data: T) {
        let encoder = JSONEncoder()
        let message: Message<T> = .init(id: id, data: data)
        let messageData = try! encoder.encode(message)
        ws?.send(.data(messageData)) { error in
            print("# ERROR: \(error?.localizedDescription ?? "No Error")")
        }
    }
    
    private func append(message: String, isPeer: Bool) {
        models.append(.init(message: message, isPeer: isPeer))
        
        DispatchQueue.main.async { [unowned self] in
            tableView.reloadData()
            tableView.scrollToRow(at: .init(row: models.count - 1, section: 0), at: .bottom, animated: true)
        }
    }
    
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text {
            chat(message: text)
        }
        textField.text = nil
        return false
    }
    
}

extension ViewController: UITableViewDelegate & UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        let model = models[indexPath.row]
        cell.configure(model)
        return cell
    }
    
}
