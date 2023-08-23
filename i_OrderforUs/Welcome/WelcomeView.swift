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
        let textLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 80))
        textLabel.text = "i: Order for Us"
        textLabel.textAlignment = .center
        textLabel.textColor = .darkGray
        textLabel.font = .monospacedSystemFont(ofSize: 20, weight: .ultraLight)
        textLabel.backgroundColor = .systemCyan
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    private let welcomeSubLabel: UILabel = {
        let textLabel = UILabel(frame: CGRect(x: 100, y: 100, width: 350, height: 50))
        textLabel.text = "Easy orders recording and notify your working companions"
        textLabel.numberOfLines = 2
        textLabel.textAlignment = .center
        textLabel.textColor = .darkGray
        textLabel.font = .monospacedSystemFont(ofSize: 16, weight: .ultraLight)
        textLabel.backgroundColor = .systemCyan
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
        button.setTitle("START", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel?.font = UIFont.monospacedSystemFont(ofSize: 16, weight: .heavy)
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
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            welcomeLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            welcomeLabel.widthAnchor.constraint(equalToConstant: 200),
            welcomeLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        welcomeContentView.addSubview(welcomeSubLabel)
        NSLayoutConstraint.activate([
            welcomeSubLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor),
            welcomeSubLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            welcomeSubLabel.widthAnchor.constraint(equalToConstant: 350),
            welcomeSubLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        welcomeContentView.addSubview(welcomeIconView)
        NSLayoutConstraint.activate([
            welcomeIconView.topAnchor.constraint(equalTo: welcomeSubLabel.bottomAnchor, constant: 30),
            welcomeIconView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            welcomeIconView.widthAnchor.constraint(equalToConstant: 300),
            welcomeIconView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        welcomeContentView.addSubview(startOrderButton)
        NSLayoutConstraint.activate([
            startOrderButton.topAnchor.constraint(equalTo: welcomeIconView.bottomAnchor, constant: 50),
            startOrderButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            startOrderButton.widthAnchor.constraint(equalToConstant: 200),
            startOrderButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
//        welcomeContentView.addSubview(testButton)
//        NSLayoutConstraint.activate([
//            testButton.topAnchor.constraint(equalTo: startOrderButton.bottomAnchor, constant: 50),
//            testButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
//            testButton.widthAnchor.constraint(equalToConstant: 200),
//            testButton.heightAnchor.constraint(equalToConstant: 50)
//        ])
    }
    
    

}
