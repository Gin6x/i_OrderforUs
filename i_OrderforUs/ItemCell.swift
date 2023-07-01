//
//  ItemCell.swift
//  i_OrderforUs
//
//  Created by Gin on 1/7/2023.
//

import UIKit

class ItemCell: UITableViewCell {

    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Who is ordering?"
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
    let itemTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "What have been ordered?"
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
    let priceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "How much?"
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Company or personal email for future reference"
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Optional contact number"
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupOrderCell () {
        
        contentView.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            nameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
        ])
        
        contentView.addSubview(itemTextField)
        NSLayoutConstraint.activate([
            itemTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            itemTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            itemTextField.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            itemTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
        ])
        
        contentView.addSubview(priceTextField)
        NSLayoutConstraint.activate([
            priceTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            priceTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            priceTextField.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            priceTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
        ])
        
        contentView.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            emailTextField.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            emailTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
        ])
        
//        contentView.addSubview(nameTextField)
//        NSLayoutConstraint.activate([
//            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
//            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            nameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            nameTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 8)
//        ])
    }
}
