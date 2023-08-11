//
//  OrderCell.swift
//  i_OrderforUs
//
//  Created by Gin on 2/6/2023.
//

import UIKit

//protocol OrderCellDelagate: AnyObject {
//    func updatePhotoData(_ cell:OrderCell, photo: UIImage)
//    func updateShopNameData(_ cell: OrderCell, shopName: String)
//}

class OrderCell: UITableViewCell {
    
//    weak var delegate: OrderCellDelagate?
    
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
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    var shopDataLabel: UILabel = {
        let label = UILabel()
        label.text = "Empty"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    private let shopNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
//        stackView.distribution = .equalCentering
        stackView.spacing = 0.01
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
        
        shopNameStackView.addArrangedSubview(shopNameLabel)
        shopNameStackView.addArrangedSubview(shopDataLabel)
        contentView.addSubview(shopNameStackView)
        NSLayoutConstraint.activate([
            shopNameStackView.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 8),
            shopNameStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            shopNameStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
        
//        contentView.addSubview(menuTextField)
//        NSLayoutConstraint.activate([
//            menuTextField.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 10),
//            menuTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
//            menuTextField.topAnchor.constraint(equalTo: topAnchor, constant: 5),
//            menuTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
//            menuTextField.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
    }
}
