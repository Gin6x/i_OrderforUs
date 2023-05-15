//
//  WelcomeView.swift
//  i_OrderforUs
//
//  Created by Gin on 8/5/2023.
//

import UIKit

class WelcomeView: UIView {
        
    private let welcomeContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemCyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let welcomeLabel: UILabel = {
        let textLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 150))
        textLabel.text = "I: Order for Us"
        textLabel.textAlignment = .center
        textLabel.textColor = .darkGray
        textLabel.backgroundColor = .white
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let welcomeIconView: UIView = {
        let iconView = UIView()
        iconView.backgroundColor = .darkGray
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    let startOrderButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = .white
        button.setTitle("Start your order", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()
    
    let testButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.backgroundColor = .white
        button.setTitle("Go orderVC", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
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
        
        addSubview(welcomeContentView)
        NSLayoutConstraint.activate([
            welcomeContentView.topAnchor.constraint(equalTo: topAnchor),
            welcomeContentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            welcomeContentView.leftAnchor.constraint(equalTo: leftAnchor),
            welcomeContentView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
        
        welcomeContentView.addSubview(welcomeLabel)
        let safeArea = welcomeContentView.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            welcomeLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            welcomeLabel.widthAnchor.constraint(equalToConstant: 200),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        welcomeContentView.addSubview(welcomeIconView)
        NSLayoutConstraint.activate([
            welcomeIconView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            welcomeIconView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            welcomeIconView.widthAnchor.constraint(equalToConstant: 200),
            welcomeIconView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        welcomeContentView.addSubview(startOrderButton)
        NSLayoutConstraint.activate([
            startOrderButton.topAnchor.constraint(equalTo: welcomeIconView.bottomAnchor, constant: 50),
            startOrderButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            startOrderButton.widthAnchor.constraint(equalToConstant: 200),
            startOrderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        welcomeContentView.addSubview(testButton)
        NSLayoutConstraint.activate([
            testButton.topAnchor.constraint(equalTo: startOrderButton.bottomAnchor, constant: 50),
            testButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            testButton.widthAnchor.constraint(equalToConstant: 200),
            testButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
        
        
    }
    
    

}
