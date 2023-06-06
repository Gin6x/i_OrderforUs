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
        title = "Order"
        self.view = orderView
        orderView.orderTableView.dataSource = self
        
        //add rightBarbutton as Dismiss
        let rightBarButton = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(buttonTapped))
        navigationItem.rightBarButtonItem = rightBarButton

        
//        let fullScreenSize = UIScreen.main.bounds.size
        
//        let orderTableView = UITableView(frame: CGRect(x: 0, y: 0,width: fullScreenSize.width,height: fullScreenSize.height),style: .grouped)
        
//        orderTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//
//        orderTableView.delegate = self
//        orderTableView.dataSource = self
//
//        orderTableView.separatorStyle = .singleLine
//        orderTableView.allowsSelection = true
//
//        self.view.addSubview(orderTableView)
    }
    
    @objc func buttonTapped () {
        print("OrderVC dismissed")
        dismiss(animated: true)
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}




