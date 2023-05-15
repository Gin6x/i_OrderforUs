//
//  OrderViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 16/5/2023.
//

import UIKit

class OrderViewController: UIViewController {
    
    let orderView = OrderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = orderView
    }

}
