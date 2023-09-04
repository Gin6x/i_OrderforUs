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
        tableView.allowsSelection = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HistoryCell.self, forCellReuseIdentifier: "historyCell")
        return tableView
    }()
    
    let noDataLabel: UILabel = {
        let label = UILabel()
        label.text = "No order is currently available, please add order record in 'Order' section."
        label.numberOfLines = 3
        label.font = .monospacedSystemFont(ofSize: 16, weight: .ultraLight)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
            historyContentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            historyContentView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        historyContentView.addSubview(historyTableView)
        NSLayoutConstraint.activate([
            historyTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            historyTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8),
            historyTableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            historyTableView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8)
        ])
        
        historyTableView.addSubview(noDataLabel)
        NSLayoutConstraint.activate([
            noDataLabel.centerXAnchor.constraint(equalTo: historyTableView.centerXAnchor),
            noDataLabel.centerYAnchor.constraint(equalTo: historyTableView.centerYAnchor),
            noDataLabel.leadingAnchor.constraint(equalTo: historyTableView.leadingAnchor, constant: 10),
            noDataLabel.trailingAnchor.constraint(equalTo: historyTableView.trailingAnchor, constant: -10)
        ])
    }

}
