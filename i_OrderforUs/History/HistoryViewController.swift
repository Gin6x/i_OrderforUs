//
//  HistoryViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 9/8/2023.
//

import UIKit

class HistoryViewController: UIViewController {
    
    private let historyView = HistoryView()
    private var savedOrdersArray: [Order]?
    private let defaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
        self.view = historyView
        historyView.historyTableView.delegate = self
        historyView.historyTableView.dataSource = self
        loadOrder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadOrder()
    }
    
    func loadOrder() {
        
        //Check if there are any saved orders and load the saved order array
        if let savedOrders = defaults.data(forKey: "savedOrders"),
           let decodedOrders = try? JSONDecoder().decode([Order].self, from: savedOrders) {
            savedOrdersArray = decodedOrders
            if savedOrdersArray!.count >= 1 {
                historyView.noDataLabel.isHidden = true
                historyView.historyTableView.reloadData()
            }
            print("saved orders loaded")
        }
    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedOrdersArray?.count ?? 0
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return savedOrdersArray?.count ?? 1
//    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Item \(section + 1)"
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 33.0
//        } else if section >= 1 {
//            return 15.0
//        }
//        return 15.0
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let historyCell = historyView.historyTableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryCell
        if let orders = savedOrdersArray {
            let order = orders[indexPath.row]
            historyCell.shopNameLabel.text = order.shopName
            //Convert data
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            historyCell.dateLabel.text = formatter.string(from: order.orderDate)
            //Convert decimal to string
            let totalPriceInString = String(describing: order.totalPrice)
            historyCell.totalPriceLabel.text = "£\(totalPriceInString)"
        }
        return historyCell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
}
//
//    override func viewWillAppear(_ animated: Bool) {
//        orderKey = getOrderKey()
////        loadDataFromUserDefault()
//        historyView.historyTableView.reloadData()
//    }
//
//    func getOrderKey() -> [String] {
//
//        var uniqueKeys: [String] = []
//        var counter = 1
//
//        while true {
//            let key = "savedOrder\(counter)"
//
//            if UserDefaults.standard.object(forKey: key) == nil {
//                break
//            }
//            uniqueKeys.append(key)
//            counter += 1
//        }
//        print(uniqueKeys)
//        return uniqueKeys
//    }

//    func loadDataFromUserDefault() {
//
//        for order in orderKey {
//            if let savedData = UserDefaults.standard.data(forKey: order) {
//                let decoder = JSONDecoder()
//                do {
//                    let loadedOrder = try decoder.decode(Order.self, from: savedData)
//                    displayOrder.append(loadedOrder)
//                } catch {
//                    print("Error decoding the order:", error)
//                }
//                print(displayOrder)
//                historyView.historyTableView.reloadData()
//            }
//        }
//    }