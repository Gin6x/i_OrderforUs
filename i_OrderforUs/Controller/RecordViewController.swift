//
//  RecordViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 28/7/2023.
//

import UIKit

class RecordViewController: UIViewController {
    
    let recordView = RecordView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Record"
        self.view = recordView
    }

    
}
