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
    
    let menuTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Restaurant Name"
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
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
        
        contentView.addSubview(menuTextField)
        NSLayoutConstraint.activate([
            menuTextField.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 10),
            menuTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            menuTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
