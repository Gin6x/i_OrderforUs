//
//  OrderViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 16/5/2023.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var orderInfo = [
        ["Name": "Mary", "Email": "123@gmail.com", "Order": "LSD fried rice", "Price": "$46"],
        ["Name": "Gary", "Email": "456@gmail.com", "Order": "LSD fried noodle", "Price": "$49"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Order"
        let barButtonItem = UIBarButtonItem(title: "Dismiss", style: .plain, target: self, action: #selector(buttonTapped))
        navigationItem.rightBarButtonItem = barButtonItem

        
        let fullScreenSize = UIScreen.main.bounds.size
        
        let orderTableView = UITableView(frame: CGRect(x: 0, y: 0,width: fullScreenSize.width,height: fullScreenSize.height),style: .grouped)
        
        orderTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        orderTableView.delegate = self
        orderTableView.dataSource = self
        
        orderTableView.separatorStyle = .singleLine
        orderTableView.allowsSelection = true
        
        self.view.addSubview(orderTableView)
    }
    
    @objc func buttonTapped () {
        print("OrderVC dismissed")
        dismiss(animated: true)
    }

   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderInfo[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 取得 tableView 目前使用的 cell
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell

//            // 設置 Accessory 按鈕樣式
//            if indexPath.section == 1 {
//                if indexPath.row == 0 {
//                    cell.accessoryType = .checkmark
//                } else if indexPath.row == 1 {
//                    cell.accessoryType = .detailButton
//                } else if indexPath.row == 2 {
//                    cell.accessoryType =
//                      .detailDisclosureButton
//                } else if indexPath.row == 3 {
//                    cell.accessoryType = .disclosureIndicator
//                }
//            }
//
            // 顯示的內容
            if let myLabel = cell.textLabel {
                myLabel.text = "\(orderInfo[indexPath.section])"
            }

            return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return orderInfo.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "Item1" : "Item2"
            return title
    }
}




