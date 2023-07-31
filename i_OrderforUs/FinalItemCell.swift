//
//  FinalItemCell.swift
//  i_OrderforUs
//
//  Created by Gin on 31/7/2023.
//

import UIKit

class FinalItemCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let nameDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Bob"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
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
        label.text = "item: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let itemDataLabel: UILabel = {
        let label = UILabel()
        label.text = "XXX noodles"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
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
        label.text = "Price: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let priceDataLabel: UILabel = {
        let label = UILabel()
        label.text = "$22"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
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
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(nameDataLabel)
        contentView.addSubview(nameStackView)
        NSLayoutConstraint.activate([
            nameStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            nameStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            nameStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5)
        ])
        
        itemStackView.addArrangedSubview(itemLabel)
        itemStackView.addArrangedSubview(itemDataLabel)
        contentView.addSubview(itemStackView)
        NSLayoutConstraint.activate([
            itemStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            itemStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            itemStackView.topAnchor.constraint(equalTo: nameStackView.topAnchor, constant: 5)
        ])
        
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(priceDataLabel)
        contentView.addSubview(priceStackView)
        NSLayoutConstraint.activate([
            priceStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            priceStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            priceStackView.topAnchor.constraint(equalTo: itemStackView.topAnchor, constant: 5)
        ])
        
        entriesStackView.addArrangedSubview(nameStackView)
        entriesStackView.addArrangedSubview(itemStackView)
        entriesStackView.addArrangedSubview(priceStackView)
        contentView.addSubview(entriesStackView)
        NSLayoutConstraint.activate([
            entriesStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            entriesStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            entriesStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            entriesStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
    }

}
