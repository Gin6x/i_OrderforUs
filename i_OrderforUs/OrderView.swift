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
        view.backgroundColor = .systemGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
