//
//  DetailHistoryView.swift
//  i_OrderforUs
//
//  Created by Gin on 15/8/2023.
//

import UIKit

class DetailHistoryView: UIView {
    
    private let detailHistoryContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let shopNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Shop"
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
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camera.svg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let detailHistoryTableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .grouped)
        tableView.backgroundColor = .systemCyan
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ItemCell.self, forCellReuseIdentifier: "itemCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        addSubview(detailHistoryContentView)
        NSLayoutConstraint.activate([
            detailHistoryContentView.topAnchor.constraint(equalTo: topAnchor),
            detailHistoryContentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            detailHistoryContentView.leftAnchor.constraint(equalTo: leftAnchor),
            detailHistoryContentView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        detailHistoryContentView.addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        topView.addSubview(shopNameLabel)
        NSLayoutConstraint.activate([
            shopNameLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 12),
            shopNameLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15),
            shopNameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 150)
        ])
        
        topView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 12),
            dateLabel.leadingAnchor.constraint(equalTo: shopNameLabel.trailingAnchor, constant: 12),
            dateLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 150)
        ])
        
        topView.addSubview(totalPriceLabel)
        NSLayoutConstraint.activate([
            totalPriceLabel.topAnchor.constraint(equalTo: shopNameLabel.bottomAnchor, constant: 12),
            totalPriceLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15),
            totalPriceLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 120)
        ])
        
        topView.addSubview(photoImageView)
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 15),
            photoImageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -15),
            photoImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor)
        ])

        detailHistoryContentView.addSubview(detailHistoryTableView)
        NSLayoutConstraint.activate([
            detailHistoryTableView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            detailHistoryTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            detailHistoryTableView.leftAnchor.constraint(equalTo: leftAnchor),
            detailHistoryTableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}
