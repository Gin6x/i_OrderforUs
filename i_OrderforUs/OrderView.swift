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
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let orderTableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 200, height: 100), style: .grouped)
        return tableView
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
    }
}
