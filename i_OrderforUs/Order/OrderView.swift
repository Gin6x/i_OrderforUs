//
//  OrderView.swift
//  i_OrderforUs
//
//  Created by Gin on 16/5/2023.
//

import UIKit

class OrderView: UIView {

    private let orderContentView: UIView = {
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
    
    private let topDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Upload a menu or receipt"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 14, weight: .ultraLight)
        return label
    }()
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camera.svg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let setImageButton: UIButton = {
        let button = UIButton()
        button.setTitle(" ", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shopNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Shop:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = .monospacedSystemFont(ofSize: 18, weight: .ultraLight)
        return label
    }()
    
    let shopNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "XXX Restaurant"
        textField.keyboardType = .default
        return textField
    }()
    
    private let shopNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let middleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let addItemButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add item", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let orderTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ItemCell.self, forCellReuseIdentifier: "itemCell")
        return tableView
    }()
    
    let noDataLabel: UILabel = {
        let label = UILabel()
        label.text = "No item is currently available, please tap 'Add item' to add new item."
        label.numberOfLines = 3
        label.font = .monospacedSystemFont(ofSize: 16, weight: .ultraLight)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(orderContentView)
        NSLayoutConstraint.activate([
            orderContentView.topAnchor.constraint(equalTo: topAnchor),
            orderContentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            orderContentView.leftAnchor.constraint(equalTo: leftAnchor),
            orderContentView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        orderContentView.addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        topView.addSubview(topDescriptionLabel)
        NSLayoutConstraint.activate([
            topDescriptionLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 8),
            topDescriptionLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 15),
            topDescriptionLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -15),
        ])
        
        topView.addSubview(photoImageView)
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 30),
            photoImageView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
            photoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor)
        ])
        
        topView.addSubview(setImageButton)
        NSLayoutConstraint.activate([
            setImageButton.topAnchor.constraint(equalTo: photoImageView.topAnchor),
            setImageButton.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor),
            setImageButton.leftAnchor.constraint(equalTo: photoImageView.leftAnchor),
            setImageButton.rightAnchor.constraint(equalTo: photoImageView.rightAnchor)
        ])
        
        shopNameStackView.addArrangedSubview(shopNameLabel)
        NSLayoutConstraint.activate([
            shopNameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 75)
        ])
        
        shopNameStackView.addArrangedSubview(shopNameTextField)
        NSLayoutConstraint.activate([
            shopNameTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
        ])
        
        topView.addSubview(shopNameStackView)
        NSLayoutConstraint.activate([
            shopNameStackView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 50),
            shopNameStackView.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 15),
            shopNameStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
        
        orderContentView.addSubview(middleView)
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 5),
            middleView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            middleView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            middleView.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        middleView.addSubview(addItemButton)
        NSLayoutConstraint.activate([
            addItemButton.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -16)
        ])
        
        orderContentView.addSubview(orderTableView)
        NSLayoutConstraint.activate([
            orderTableView.topAnchor.constraint(equalTo: middleView.bottomAnchor),
            orderTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            orderTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            orderTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
        
        orderTableView.addSubview(noDataLabel)
        NSLayoutConstraint.activate([
            noDataLabel.centerXAnchor.constraint(equalTo: orderTableView.centerXAnchor),
            noDataLabel.centerYAnchor.constraint(equalTo: orderTableView.centerYAnchor),
            noDataLabel.leadingAnchor.constraint(equalTo: orderTableView.leadingAnchor, constant: 10),
            noDataLabel.trailingAnchor.constraint(equalTo: orderTableView.trailingAnchor, constant: -10)
        ])
    }
}
