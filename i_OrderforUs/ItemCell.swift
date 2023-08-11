//
//  ItemCell.swift
//  i_OrderforUs
//
//  Created by Gin on 1/7/2023.
//

import UIKit

class ItemCell: UITableViewCell {
    
    private let customerNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name :"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    var customerNameDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Gin"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let customerNameStackView: UIStackView = {
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
    
    var itemDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Americano"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        return label
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
    
    var priceDataLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        return label
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
    
    var emailDataLabel: UILabel = {
        let label = UILabel()
        label.text = "123123123123@gmail.com"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        return label
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        customerNameStackView.addArrangedSubview(customerNameLabel)
        customerNameStackView.addArrangedSubview(customerNameDataLabel)
        contentView.addSubview(customerNameStackView)
        NSLayoutConstraint.activate([
            customerNameStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            customerNameStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            customerNameStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5)
        ])
        
        itemStackView.addArrangedSubview(itemLabel)
        itemStackView.addArrangedSubview(itemDataLabel)
        contentView.addSubview(itemStackView)
        NSLayoutConstraint.activate([
            itemStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            itemStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            itemStackView.topAnchor.constraint(equalTo: customerNameStackView.bottomAnchor, constant: 5)
        ])
        
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(priceDataLabel)
        contentView.addSubview(priceStackView)
        NSLayoutConstraint.activate([
            priceStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            priceStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            priceStackView.topAnchor.constraint(equalTo: itemStackView.bottomAnchor, constant: 5)
        ])
        
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailDataLabel)
        contentView.addSubview(emailStackView)
        NSLayoutConstraint.activate([
            emailStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            emailStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            emailStackView.topAnchor.constraint(equalTo: priceStackView.bottomAnchor, constant: 5)
        ])
        
        entriesStackView.addArrangedSubview(customerNameStackView)
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
