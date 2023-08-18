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
    
    let shopNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Restaurant name"
        textField.keyboardType = .default
        textField.tag = 0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let customerNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Name"
        textField.keyboardType = .default
        textField.tag = 1
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let itemTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Item"
        textField.keyboardType = .default
        textField.tag = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let currencyPickerView: UIPickerView = {
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 0, height: 15))
        pickerView.backgroundColor = .white
        pickerView.layer.cornerRadius = 5
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    let priceTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Price"
        textField.keyboardType = .numberPad
        textField.tag = 3
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
//        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Company / Personal email"
        textField.keyboardType = .emailAddress
        textField.tag = 4
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
        addSubview(shopNameTextField)
        NSLayoutConstraint.activate([
            shopNameTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            shopNameTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            shopNameTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        
        addSubview(customerNameTextField)
        NSLayoutConstraint.activate([
            customerNameTextField.topAnchor.constraint(equalTo: shopNameTextField.bottomAnchor, constant: 8),
            customerNameTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            customerNameTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        
        addSubview(itemTextField)
        NSLayoutConstraint.activate([
            itemTextField.topAnchor.constraint(equalTo: customerNameTextField.bottomAnchor, constant: 8),
            itemTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            itemTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        
        priceStackView.addArrangedSubview(currencyPickerView)
        priceStackView.addArrangedSubview(priceTextField)
        addSubview(priceStackView)
        NSLayoutConstraint.activate([
            priceStackView.topAnchor.constraint(equalTo: itemTextField.bottomAnchor, constant: 8),
            priceStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            priceStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        //currencies PickerView constraint
        NSLayoutConstraint.activate([
            currencyPickerView.leadingAnchor.constraint(equalTo: priceStackView.leadingAnchor),
            currencyPickerView.trailingAnchor.constraint(equalTo: priceStackView.trailingAnchor, constant: -300),
            currencyPickerView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: priceStackView.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
}

