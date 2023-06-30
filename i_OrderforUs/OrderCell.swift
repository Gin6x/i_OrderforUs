//
//  OrderCell.swift
//  i_OrderforUs
//
//  Created by Gin on 2/6/2023.
//

import UIKit

class OrderCell: UITableViewCell {
    
    private let menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let menuTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Add detail for the menu"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
//    private let dataTextField: UITextField = {
//        let textField = UITextField()
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.font = UIFont.systemFont(ofSize: 20)
//        return textField
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configmenucCell()
//        configmenuTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configmenucCell () {
        addSubview(menuView)
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            menuView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            menuView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            menuView.widthAnchor.constraint(equalTo: menuView.heightAnchor)
        ])
        
        addSubview(menuTextField)
        NSLayoutConstraint.activate([
            menuTextField.leadingAnchor.constraint(equalTo: menuView.trailingAnchor, constant: 20),
            menuTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            menuTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
//    func configmenuTextField() {
//
//    }
    
}
