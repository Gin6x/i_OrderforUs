//
//  HomeViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 8/5/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    let welcomeView = WelcomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = welcomeView
    }
}
