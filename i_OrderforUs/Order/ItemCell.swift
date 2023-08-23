//
//  ItemCell.swift
//  i_OrderforUs
//
//  Created by Gin on 1/7/2023.
//

import UIKit

class ItemCell: UITableViewCell {
    
    private let customerNameDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Name:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        return label
    }()
    
    let customerNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let itemDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Item:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        return label
    }()
    
    let itemLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Price:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Email:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        
        contentView.addSubview(customerNameDescriptionLabel)
        NSLayoutConstraint.activate([
            customerNameDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            customerNameDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            customerNameDescriptionLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 70)
        ])
        
        contentView.addSubview(customerNameLabel)
        NSLayoutConstraint.activate([
            customerNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            customerNameLabel.leadingAnchor.constraint(equalTo: customerNameDescriptionLabel.trailingAnchor, constant: -5),
            customerNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
        contentView.addSubview(itemDescriptionLabel)
        NSLayoutConstraint.activate([
            itemDescriptionLabel.topAnchor.constraint(equalTo: customerNameDescriptionLabel.bottomAnchor, constant: 8),
            itemDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            itemDescriptionLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 70)
        ])
        
        contentView.addSubview(itemLabel)
        NSLayoutConstraint.activate([
            itemLabel.topAnchor.constraint(equalTo: customerNameLabel.bottomAnchor, constant: 8),
            itemLabel.leadingAnchor.constraint(equalTo: itemDescriptionLabel.trailingAnchor, constant: -5),
            itemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
        contentView.addSubview(priceDescriptionLabel)
        NSLayoutConstraint.activate([
            priceDescriptionLabel.topAnchor.constraint(equalTo: itemDescriptionLabel.bottomAnchor, constant: 8),
            priceDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            priceDescriptionLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 70)
        ])
        
        contentView.addSubview(priceLabel)
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: itemLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: priceDescriptionLabel.trailingAnchor, constant: 5),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
        contentView.addSubview(emailDescriptionLabel)
        NSLayoutConstraint.activate([
            emailDescriptionLabel.topAnchor.constraint(equalTo: priceDescriptionLabel.bottomAnchor, constant: 8),
            emailDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            emailDescriptionLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 70)
        ])
        
        contentView.addSubview(emailLabel)
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            emailLabel.leadingAnchor.constraint(equalTo: emailDescriptionLabel.trailingAnchor, constant: 5),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
    }
}
