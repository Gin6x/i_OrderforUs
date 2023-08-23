//
//  OrderCell.swift
//  i_OrderforUs
//
//  Created by Gin on 2/6/2023.
//

import UIKit


class OrderCell: UITableViewCell {
    
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "camera.svg")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let setImageButton: UIButton = {
        let button = UIButton(frame: CGRectZero)
        button.setTitle(" ", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shopNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Shop: "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let shopNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "ABC Restaurant"
        return textField
    }()
    
    private let shopNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.backgroundColor = .white
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell () {
        addSubview(photoImageView)
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            photoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            photoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            photoImageView.widthAnchor.constraint(equalTo: photoImageView.heightAnchor)
        ])
        
        photoImageView.addSubview(setImageButton)
        contentView.addSubview(setImageButton)
        NSLayoutConstraint.activate([
            setImageButton.topAnchor.constraint(equalTo: photoImageView.topAnchor),
            setImageButton.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor),
            setImageButton.leftAnchor.constraint(equalTo: photoImageView.leftAnchor),
            setImageButton.rightAnchor.constraint(equalTo: photoImageView.rightAnchor)
        ])
        
//        shopNameStackView.addArrangedSubview(shopNameLabel)
//        NSLayoutConstraint.activate([
//            shopNameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 55)
//        ])
//        shopNameStackView.addArrangedSubview(shopNameTextField)
//        NSLayoutConstraint.activate([
//            shopNameTextField.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
//        ])
//        
//        addSubview(shopNameStackView)
//        NSLayoutConstraint.activate([
//            shopNameStackView.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 15),
//            shopNameStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            shopNameStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
//        ])
    }
}
