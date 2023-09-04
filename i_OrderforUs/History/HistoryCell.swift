//
//  HistoryCell.swift
//  i_OrderforUs
//
//  Created by Gin on 14/8/2023.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    let shopNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Shop:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        return label
    }()
    
    let totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Price"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 15
        self.contentView.layer.masksToBounds = true
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {

        contentView.addSubview(shopNameLabel)
        NSLayoutConstraint.activate([
            shopNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            shopNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            shopNameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200)
        ])
        
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: shopNameLabel.bottomAnchor, constant: 8),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            dateLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 150)
        ])
        
        contentView.addSubview(totalPriceLabel)
        NSLayoutConstraint.activate([
            totalPriceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            totalPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
            totalPriceLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 120)
        ])
    }
}
