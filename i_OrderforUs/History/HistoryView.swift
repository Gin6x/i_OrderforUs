//
//  HistoryView.swift
//  i_OrderforUs
//
//  Created by Gin on 9/8/2023.
//

import UIKit

class HistoryView: UIView {
    
    private let historyContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let historyTableView: UITableView = {
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
        addSubview(historyContentView)
        NSLayoutConstraint.activate([
            historyContentView.topAnchor.constraint(equalTo: topAnchor),
            historyContentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            historyContentView.leftAnchor.constraint(equalTo: leftAnchor),
            historyContentView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        addSubview(historyTableView)
        NSLayoutConstraint.activate([
            historyTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            historyTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            historyTableView.leftAnchor.constraint(equalTo: leftAnchor),
            historyTableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }

}
