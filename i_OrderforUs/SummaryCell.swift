//
//  SummaryCell.swift
//  i_OrderforUs
//
//  Created by Gin on 31/7/2023.
//

import UIKit

class SummaryCell: UITableViewCell {
    
    private let shopNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Shop: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let shopDataLabel: UILabel = {
        let label = UILabel()
        label.text = "ABC"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let shopNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 0.1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Total: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let priceDataLabel: UILabel = {
        let label = UILabel()
        label.text = "$52"
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
        shopNameStackView.addArrangedSubview(shopNameLabel)
        shopNameStackView.addArrangedSubview(shopDataLabel)
        contentView.addSubview(shopNameStackView)
        NSLayoutConstraint.activate([
            shopNameStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            shopNameStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            shopNameStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5)
        ])
        
        priceStackView.addArrangedSubview(priceLabel)
        priceStackView.addArrangedSubview(priceDataLabel)
        contentView.addSubview(priceStackView)
        NSLayoutConstraint.activate([
            priceStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            priceStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            priceStackView.topAnchor.constraint(equalTo: shopNameStackView.topAnchor, constant: 5)
        ])
        
        entriesStackView.addArrangedSubview(shopNameStackView)
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
