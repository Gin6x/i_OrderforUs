//
//  formView.swift
//  i_OrderforUs
//
//  Created by Gin on 18/8/2023.
//

import UIKit

class FormView: UIView {
    
    private let formContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let customerNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Name"
        textField.keyboardType = .default
        textField.tag = 0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let itemTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Item"
        textField.keyboardType = .default
        textField.tag = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let priceTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Price"
        textField.keyboardType = .numbersAndPunctuation
        textField.tag = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Company / Personal email"
        textField.keyboardType = .emailAddress
        textField.tag = 3
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let warningLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = " "
        label.numberOfLines = 2
        label.textColor = .systemRed
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete item", for: .normal)
        button.setTitleColor(.systemRed, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame:frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        addSubview(formContentView)
        NSLayoutConstraint.activate([
            formContentView.topAnchor.constraint(equalTo: topAnchor),
            formContentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            formContentView.leftAnchor.constraint(equalTo: leftAnchor),
            formContentView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        formContentView.addSubview(customerNameTextField)
        NSLayoutConstraint.activate([
            customerNameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            customerNameTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            customerNameTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        
        formContentView.addSubview(itemTextField)
        NSLayoutConstraint.activate([
            itemTextField.topAnchor.constraint(equalTo: customerNameTextField.bottomAnchor, constant: 8),
            itemTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            itemTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        
        formContentView.addSubview(priceTextField)
        NSLayoutConstraint.activate([
            priceTextField.topAnchor.constraint(equalTo: itemTextField.bottomAnchor, constant: 8),
            priceTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            priceTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        
        formContentView.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: priceTextField.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        
        formContentView.addSubview(warningLabel)
        NSLayoutConstraint.activate([
            warningLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            warningLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            warningLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8)
        ])
        
        formContentView.addSubview(deleteButton)
        NSLayoutConstraint.activate([
            deleteButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            deleteButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            deleteButton.topAnchor.constraint(equalTo: warningLabel.bottomAnchor, constant: 8)
        ])
    }
}

