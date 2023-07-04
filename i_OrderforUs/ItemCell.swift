//
//  ItemCell.swift
//  i_OrderforUs
//
//  Created by Gin on 1/7/2023.
//

import UIKit

class ItemCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name : "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Who is ordering?"
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
    private let itemLabel: UILabel = {
        let label = UILabel()
        label.text = "Item : "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let itemTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "What have been ordered?"
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price : "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let priceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "How much?"
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email : "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Company / personal email "
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
        setupOrderCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupOrderCell() {
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
        ])
        
        addSubview(itemLabel)
        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            itemLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
        ])
        
        addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 8),
            priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
        ])
        
        addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            emailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
        ])
        
        contentView.addSubview(nameTextField)
        NSLayoutConstraint.activate([
            nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            nameTextField.topAnchor.constraint(equalTo: topAnchor, constant: 10)
        ])
       
        contentView.addSubview(itemTextField)
        NSLayoutConstraint.activate([
            itemTextField.leadingAnchor.constraint(equalTo: itemLabel.trailingAnchor, constant: 8),
            itemTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8),
        ])
       
        contentView.addSubview(priceTextField)
        NSLayoutConstraint.activate([
            priceTextField.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),
            priceTextField.topAnchor.constraint(equalTo: itemTextField.bottomAnchor, constant: 8),
        ])
       
        contentView.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 8),
            emailTextField.topAnchor.constraint(equalTo: priceTextField.bottomAnchor, constant: 8),
        ])
    }
}
