//
//  OrderViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 16/5/2023.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    let orderView = OrderView()
    
    var info = [
            ["林書豪","陳信安"],
            ["陳偉殷","王建民","陳金鋒","林智勝"]
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullScreenSize = UIScreen.main.bounds.size
        
        let orderTableView = UITableView(frame: CGRect(x: 0, y: 0,width: fullScreenSize.width,height: fullScreenSize.height),style: .grouped)
        
        orderTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        orderTableView.delegate = self
        orderTableView.dataSource = self
        
        orderTableView.separatorStyle = .singleLine
        orderTableView.allowsSelection = true
        
        self.view.addSubview(orderTableView)

//        self.view = orderView
    }

   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 取得 tableView 目前使用的 cell
            let cell =
        tableView.dequeueReusableCell(
            withIdentifier: "Cell", for: indexPath) as
                UITableViewCell

            // 設置 Accessory 按鈕樣式
            if indexPath.section == 1 {
                if indexPath.row == 0 {
                    cell.accessoryType = .checkmark
                } else if indexPath.row == 1 {
                    cell.accessoryType = .detailButton
                } else if indexPath.row == 2 {
                    cell.accessoryType =
                      .detailDisclosureButton
                } else if indexPath.row == 3 {
                    cell.accessoryType = .disclosureIndicator
                }
            }

            // 顯示的內容
            if let myLabel = cell.textLabel {
                myLabel.text =
                  "\(info[indexPath.section][indexPath.row])"
            }

            return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return info.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "籃球" : "棒球"
            return title
    }
}




