//
//  DetailHistoryCell.swift
//  i_OrderforUs
//
//  Created by Gin on 15/8/2023.
//

import UIKit

class DetailHistoryCell: UITableViewCell {
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camera.svg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var shopNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Briki"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "15-08"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let orderSummaryStackView: UIStackView = {
        let stackView = UIStackView(frame: CGRectZero)
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$48"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15)
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
        
        addSubview(photoImageView)
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            photoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor)
        ])
        
        orderSummaryStackView.addArrangedSubview(shopNameLabel)
        orderSummaryStackView.addArrangedSubview(dateLabel)
        contentView.addSubview(orderSummaryStackView)
        NSLayoutConstraint.activate([
            orderSummaryStackView.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 8),
            orderSummaryStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            orderSummaryStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5)
        ])
        
        addSubview(totalPriceLabel)
        NSLayoutConstraint.activate([
            totalPriceLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 8),
            totalPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            totalPriceLabel.topAnchor.constraint(equalTo: orderSummaryStackView.bottomAnchor),
        ])
    }

}
