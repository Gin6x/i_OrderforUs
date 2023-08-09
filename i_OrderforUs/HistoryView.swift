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
    
    func setupLayout() {
        addSubview(historyContentView)
        NSLayoutConstraint.activate([
            historyContentView.topAnchor.constraint(equalTo: topAnchor),
            historyContentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            historyContentView.leftAnchor.constraint(equalTo: leftAnchor),
            historyContentView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }

}
