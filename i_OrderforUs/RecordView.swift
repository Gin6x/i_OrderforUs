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
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
    }

}
