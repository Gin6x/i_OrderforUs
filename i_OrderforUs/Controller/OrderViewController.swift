//
//  OrderViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 16/5/2023.
//

import UIKit

class OrderViewController: UIViewController {
    
    let orderView = OrderView()
    var data: [String] = ["a", "b", "c"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Order"
        self.view = orderView
        
        orderView.orderTableView.register(OrderCell.self, forCellReuseIdentifier: "cell")
        orderView.orderTableView.delegate = self
        orderView.orderTableView.dataSource = self
        
        //add rightBarbutton as Dismiss
        let rightBarButton = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(buttonTapped))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func buttonTapped () {
        print("OrderVC dismissed")
        dismiss(animated: true)
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? OrderCell {
            cell.textLabel?.text = data[indexPath.row]
            return cell
        }
        fatalError("could not dequeueReusableCell")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellHeight: CGFloat = 100
        return cellHeight
    }
}




