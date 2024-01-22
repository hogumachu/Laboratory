//
//  Cell.swift
//  ChatApp-iOS
//
//  Created by 홍성준 on 1/22/24.
//

import UIKit

final class Cell: UITableViewCell {
    
    private let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func configure(_ model: CellModel) {
        label.text = model.message
        label.textAlignment = model.isPeer ? .left : .right
        label.numberOfLines = 0
    }
    
    private func setup() {
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
}
