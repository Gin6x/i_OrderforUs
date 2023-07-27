//
//  OrderView.swift
//  i_OrderforUs
//
//  Created by Gin on 16/5/2023.
//

import UIKit

class OrderView: UIView {
    
//    private let fullScreenSize = UIScreen.main.bounds.size

    private let orderContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let orderTableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let bottomView: UIView = {
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
        
        addSubview(orderTableView)
        NSLayoutConstraint.activate([
            orderTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            orderTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            orderTableView.leftAnchor.constraint(equalTo: leftAnchor),
            orderTableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
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
