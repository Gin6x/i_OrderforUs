//
//  HomeViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 8/5/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var testingLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        testingLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        testingLabel.center = CGPoint(x: 160, y: 285)
        testingLabel.textAlignment = .center
        testingLabel.text = "Test if sourceTree and github is working"
        testingLabel.textColor = .white
        
        self.view.addSubview(testingLabel)
    
        
    }
}
