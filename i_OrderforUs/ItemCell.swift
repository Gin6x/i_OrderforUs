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
        label.text = "Name :"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Who is ordering?"
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 0.1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let itemLabel: UILabel = {
        let label = UILabel()
        label.text = "Item :"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let itemTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "What have been ordered?"
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let itemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 0.1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price :"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let priceTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "How much?"
        textField.keyboardType = .numbersAndPunctuation
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let priceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 0.1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email :"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Company / personal email "
        textField.keyboardType = .emailAddress
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let emailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 0.1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let entriesStackView: UIStackView = {
        let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
//    let phoneTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Optional contact number"
//        textField.isUserInteractionEnabled = true
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.font = UIFont.systemFont(ofSize: 20)
//        return textField
//    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(nameTextField)
        contentView.addSubview(nameStackView)
        NSLayoutConstraint.activate([
            nameStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            nameStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5)
        ])
        
        itemStackView.addArrangedSubview(itemLabel)
        itemStackView.addArrangedSubview(itemTextField)
        contentView.addSubview(itemStackView)
        NSLayoutConstraint.activate([
            itemStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            itemStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            itemStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor, constant: 5)
        ])
        
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(priceTextField)
        contentView.addSubview(priceStackView)
        NSLayoutConstraint.activate([
            priceStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            priceStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            priceStackView.topAnchor.constraint(equalTo: itemStackView.bottomAnchor, constant: 5)
        ])
        
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        contentView.addSubview(emailStackView)
        NSLayoutConstraint.activate([
            emailStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            emailStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            emailStackView.topAnchor.constraint(equalTo: priceStackView.bottomAnchor, constant: 5)
        ])
        
        entriesStackView.addArrangedSubview(nameStackView)
        entriesStackView.addArrangedSubview(itemStackView)
        entriesStackView.addArrangedSubview(priceStackView)
        entriesStackView.addArrangedSubview(emailStackView)
        contentView.addSubview(entriesStackView)
        NSLayoutConstraint.activate([
            entriesStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            entriesStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            entriesStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            entriesStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
    }
}
