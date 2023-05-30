//
//  OrderNavigationController.swift
//  i_OrderforUs
//
//  Created by Gin on 30/5/2023.
//

import UIKit

class OrderNavigationController: UINavigationController {
    
    let orderView = OrderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = orderView

    }

}
