//
//  HistoryViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 9/8/2023.
//

import UIKit

class HistoryViewController: UIViewController {
    
    let historyView = HistoryView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
        self.view = historyView
        
    }
    

  

}
