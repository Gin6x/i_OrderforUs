//
//  OrderViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 16/5/2023.
//

import UIKit

class OrderViewController: UIViewController {
    
    let orderView = OrderView()
    var data: [String] = ["a"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Order"
        self.view = orderView
        
        orderView.orderTableView.register(OrderCell.self, forCellReuseIdentifier: "cell")
        orderView.orderTableView.register(ItemCell.self, forCellReuseIdentifier: "itemCell")
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
        if section == 0 {
            return data.count
        } else if section == 1 {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderCell
            cell.menuTextField.delegate = self
            return cell
        } else if indexPath.section == 1 {
            let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
            itemCell.nameTextField.delegate = self
            itemCell.itemTextField.delegate = self
            itemCell.priceTextField.delegate = self
            itemCell.emailTextField.delegate = self
            return itemCell
        }
        fatalError("Can not return cell")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 1 {
            return "Item 1"
        }
        return ""
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            let cellHeight: CGFloat = 85
            return cellHeight
        } else if indexPath.section == 1 {
           return CGFloat(300)
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15.0
    }
}

extension OrderViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}




