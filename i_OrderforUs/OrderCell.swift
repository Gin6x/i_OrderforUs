//
//  OrderCell.swift
//  i_OrderforUs
//
//  Created by Gin on 2/6/2023.
//

import UIKit

class OrderCell: UITableViewCell {
    
    private let menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configmenuView()
        configmenuTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configmenuView () {
        addSubview(menuView)
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: topAnchor),
            menuView.bottomAnchor.constraint(equalTo: bottomAnchor),
            menuView.leftAnchor.constraint(equalTo: leftAnchor),
            menuView.widthAnchor.constraint(equalTo: menuView.heightAnchor)
        ])
    }
    
    func configmenuTextField() {
        
    }
    
}
