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
    
    let detailHistoryTableView: UITableView = {
        let tableView = UITableView(frame: CGRectZero, style: .grouped)
        tableView.backgroundColor = .systemCyan
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
        
        addSubview(detailHistoryTableView)
        NSLayoutConstraint.activate([
            detailHistoryTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            detailHistoryTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            detailHistoryTableView.leftAnchor.constraint(equalTo: leftAnchor),
            detailHistoryTableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }

}
