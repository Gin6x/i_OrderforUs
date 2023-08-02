//
//  OrderViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 16/5/2023.
//

import UIKit

class OrderViewController: UIViewController {
    
    let orderView = OrderView()
    var numberOfSection = 2
    var headerTitle = ["Item 1"]
    //OrderData
    var shopname: [String] = []
    var orderDate = Date()
    var names: [String] = []
    var items: [String] = []
    var prices: [Double] = []
    var totalPrice: [String] = []
    var emails: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Order"
        self.view = orderView
        
        orderView.orderTableView.delegate = self
        orderView.orderTableView.dataSource = self
        orderView.orderTableView.register(OrderCell.self, forCellReuseIdentifier: "orderCell")
        orderView.orderTableView.register(ItemCell.self, forCellReuseIdentifier: "itemCell")
       
//        orderView.orderTableView.estimatedRowHeight = 300.0
//        orderView.orderTableView.rowHeight = UITableView.automaticDimension
        
        let leftBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButton
        
        orderView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc func nextButtonTapped() {
        let recordVC = RecordViewController()
//        let newOrder = OrderData(shopName: shopname, name: names, item: items, price: prices, email: emails)
//        print(newOrder)
        recordVC.shopname = self.shopname
        recordVC.names = self.names
        recordVC.items = self.items
        recordVC.prices = self.prices
        calTotalPrice()
        recordVC.emails = self.emails
        recordVC.totalPrice = self.totalPrice
        recordVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(recordVC, animated: true)
    }
    
    @objc func cancelButtonTapped() {
        print("OrderVC dismissed")
        dismiss(animated: true)
    }
    
    @objc func addButtonTapped() {
        numberOfSection += 1
        
        let newTitle = "Item \(headerTitle.count + 1)"
        headerTitle.append(newTitle)
        print(headerTitle)

        let indexSet = IndexSet(integer: numberOfSection - 1)
        orderView.orderTableView.beginUpdates()
        orderView.orderTableView.insertSections(indexSet, with: .automatic)
        orderView.orderTableView.endUpdates()
        print("added new item")
    }
    
    func calTotalPrice() {
        let recordVC = RecordViewController()
        let total = prices.reduce(0, +)
        let totalInStr = String(total)
        totalPrice.append(totalInStr)
        print(totalInStr)
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section >= 1 {
            return 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderCell
            cell.menuTextField.delegate = self
            cell.menuTextField.tag = 1
            return cell
        } else if indexPath.section >= 1 {
            let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
            itemCell.nameTextField.delegate = self
            itemCell.itemTextField.delegate = self
            itemCell.priceTextField.delegate = self
            itemCell.emailTextField.delegate = self
            itemCell.nameTextField.tag = 2
            itemCell.itemTextField.tag = 3
            itemCell.priceTextField.tag = 4
            itemCell.emailTextField.tag = 5
            return itemCell
        }
        fatalError("Can not return cell")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        if section == 0 {
            return "Menu"
        } else if section == 1 {
            return "Your Item"
        } else if section >= 1 {
            return headerTitle[section - 1]
        }
        return ""
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSection
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 85.0
        } else if indexPath.section >= 1 {
            return 210
        }
        
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 30.0
        } else if section >= 1 {
            return 15.0
        }
        
        return 15.0
    }
}

extension OrderViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
     
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 1:
            if let restaurantName = textField.text {
                shopname.append(restaurantName)
                print(shopname)
            }
            break
            
        case 2:
            if let name = textField.text {
                names.append(name)
                print(names)
            }
            break
            
        case 3:
            if let item = textField.text {
                items.append(item)
                print(items)
            }
            break
            
        case 4:
            if let price = textField.text {
                if let priceDouble = Double(price) {
                    prices.append(priceDouble)
                    print(prices)
                }
            }
            break
            
        case 5:
            if let email = textField.text {
                emails.append(email)
                print(emails)
            }
            break
            
        default:
            fatalError("No value")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
}




