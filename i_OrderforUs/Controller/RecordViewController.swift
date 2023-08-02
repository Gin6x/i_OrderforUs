//
//  RecordViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 28/7/2023.
//

import UIKit

class RecordViewController: UIViewController {
    
    let recordView = RecordView()
    let orderVC = OrderViewController()
    var numberOfSection = 2

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
        title = "Record"
        self.view = recordView
        
        recordView.recordTableView.register(SummaryCell.self, forCellReuseIdentifier: "summaryCell")
        recordView.recordTableView.register(FinalItemCell.self, forCellReuseIdentifier: "finalitemCell")
        recordView.recordTableView.delegate = self
        recordView.recordTableView.dataSource = self
        
        //save/email/exit button
        recordView.savebutton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    @objc func saveButtonPressed() {
        print("save button pressed")
        print("\(shopname)")
        print("\(names)")
        print("\(items)")
        print("\(prices)")
        print("\(totalPrice)")
//        dismiss(animated: true)
    }
}

extension RecordViewController: UITableViewDelegate, UITableViewDataSource {
    
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "summaryCell", for: indexPath) as! SummaryCell
            cell.shopDataLabel.text = shopname[indexPath.row]
            cell.priceDataLabel.text = totalPrice[indexPath.row]
            return cell
        } else if indexPath.section >= 1 {
            let finalitemCell = tableView.dequeueReusableCell(withIdentifier: "finalitemCell", for: indexPath) as! FinalItemCell
            finalitemCell.nameDataLabel.text = names[indexPath.section - 1]
            finalitemCell.itemDataLabel.text = items[indexPath.section - 1]
            let pricesInStr = prices.map{String($0)}
            finalitemCell.priceDataLabel.text = pricesInStr[indexPath.section - 1]
            return finalitemCell
        }
        fatalError("Can not return cell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return names.count + 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        if section == 0 {
            return "Summary"
        } else if section >= 1 {
            return "Item"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 85.0
        } else if indexPath.section >= 1 {
            return 100
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

