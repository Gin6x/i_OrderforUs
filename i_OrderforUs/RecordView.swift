//
//  RecordView.swift
//  i_OrderforUs
//
//  Created by Gin on 28/7/2023.
//

import UIKit

class RecordView: UIView {
    
    private let recordContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let recordTableView: UITableView = {
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
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(recordContentView)
        NSLayoutConstraint.activate([
            recordContentView.topAnchor.constraint(equalTo: topAnchor),
            recordContentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            recordContentView.leftAnchor.constraint(equalTo: leftAnchor),
            recordContentView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        addSubview(recordTableView)
        NSLayoutConstraint.activate([
            recordTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            recordTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -50),
            recordTableView.leftAnchor.constraint(equalTo: leftAnchor),
            recordTableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        addSubview(bottomView)
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: recordTableView.bottomAnchor),
            bottomView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            bottomView.leftAnchor.constraint(equalTo: leftAnchor),
            bottomView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
    }

}
