//
//  ViewController.swift
//  LocalizingSample
//
//  Created by 홍성준 on 3/29/24.
//

import UIKit
import ResourceKit
import LocalizedMacro

final class ViewController: UIViewController {
  
  private let greetingLabel = UILabel()
  private let welcomeLabel = UILabel()
  private let macroLabel = UILabel()
  private let extensionLabel = UILabel()
  private let moduleLabel = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    greetingLabel.text = "This is Greeting".localized(.main) // 자동으로 생성되지 않음
    greetingLabel.translatesAutoresizingMaskIntoConstraints = false
    
    welcomeLabel.text = NSLocalizedString("This is Welcome", comment: "") // 자동으로 생성
    welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
    
    macroLabel.text = #localizing("This is Macro") // 자동으로 생성되지 않음
    macroLabel.translatesAutoresizingMaskIntoConstraints = false
    
    extensionLabel.localizing = "This is Extension" // 자동으로 생성되지 않음
    extensionLabel.translatesAutoresizingMaskIntoConstraints = false
    
    moduleLabel.text = "This is Module".localized() // 자동으로 생성되지 않음
    moduleLabel.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(greetingLabel)
    view.addSubview(welcomeLabel)
    view.addSubview(macroLabel)
    view.addSubview(extensionLabel)
    view.addSubview(moduleLabel)
    NSLayoutConstraint.activate([
      greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      welcomeLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 3),
      macroLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      macroLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 3),
      extensionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      extensionLabel.topAnchor.constraint(equalTo: macroLabel.bottomAnchor, constant: 3),
      moduleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      moduleLabel.topAnchor.constraint(equalTo: extensionLabel.bottomAnchor, constant: 3),
    ])
  }
  
}

extension UILabel {
  
  var localizing: String? {
    get { self.text }
    set {
      guard let newValue else { return }
      self.text = NSLocalizedString(newValue, comment: "")
    }
  }
  
}
