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
    
//    private let topView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .systemTeal
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
//    let shopNameTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Restaurant Name"
//        textField.textAlignment = .center
//        textField.isUserInteractionEnabled = true
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.font = UIFont.systemFont(ofSize: 20)
//        textField.borderStyle = .roundedRect
//        return textField
//    }()

    let orderTableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(frame:CGRectZero)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .systemTeal
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        
        
//        addSubview(orderScrollView)
//        NSLayoutConstraint.activate([
//            orderScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            orderScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
//            orderScrollView.leftAnchor.constraint(equalTo: leftAnchor),
//            orderScrollView.rightAnchor.constraint(equalTo: rightAnchor)
//        ])
        
//        orderScrollView.addSubview(orderTableView)
        addSubview(orderTableView)
        NSLayoutConstraint.activate([
            orderTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            orderTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            orderTableView.leftAnchor.constraint(equalTo: leftAnchor),
            orderTableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
//        addSubview(topView)
//        NSLayoutConstraint.activate([
//            topView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            topView.bottomAnchor.constraint(equalTo: orderTableView.topAnchor),
//            topView.leftAnchor.constraint(equalTo: leftAnchor),
//            topView.rightAnchor.constraint(equalTo: rightAnchor)
//        ])
//        
//        topView.addSubview(shopNameTextField)
//        NSLayoutConstraint.activate([
//            shopNameTextField.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
//            shopNameTextField.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -10),
//            shopNameTextField.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 50),
//            shopNameTextField.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -50)
//        ])
        
        addSubview(bottomView)
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: orderTableView.bottomAnchor),
            bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            bottomView.leftAnchor.constraint(equalTo: leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        bottomView.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 10),
            nextButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -10),
            nextButton.leftAnchor.constraint(equalTo: bottomView.leftAnchor, constant: 50),
            nextButton.rightAnchor.constraint(equalTo: bottomView.rightAnchor, constant: -50)
        ])
    }
}
