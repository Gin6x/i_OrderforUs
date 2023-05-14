//
//  WelcomeViewContoller.swift
//  i_OrderforUs
//
//  Created by Gin on 8/5/2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let welcomeView = WelcomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = welcomeView
        welcomeView.startOrderButton.addTarget(self, action: #selector(startButtonPressed) , for: .touchUpInside)
    }
    
    @objc func startButtonPressed() {
        print("Start button pressed")
    }
    
    
}
