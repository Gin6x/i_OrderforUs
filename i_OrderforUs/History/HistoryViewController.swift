//
//  HistoryViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 9/8/2023.
//

import UIKit

class HistoryViewController: UIViewController {
    
    let historyView = HistoryView()
    var orderKey: [String] = []
    var displayOrder: [Order] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
        self.view = historyView
        
        historyView.historyTableView.delegate = self
        historyView.historyTableView.dataSource = self
        historyView.historyTableView.register(HistoryCell.self, forCellReuseIdentifier: "historyCell")
        historyView.historyTableView.allowsSelection = true
        orderKey = getOrderKey()
//        loadDataFromUserDefault()
        historyView.historyTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        orderKey = getOrderKey()
//        loadDataFromUserDefault()
        historyView.historyTableView.reloadData()
    }
    
    func getOrderKey() -> [String] {
        
        var uniqueKeys: [String] = []
        var counter = 1
        
        while true {
            let key = "savedOrder\(counter)"
            
            if UserDefaults.standard.object(forKey: key) == nil {
                break
            }
            uniqueKeys.append(key)
            counter += 1
        }
        print(uniqueKeys)
        return uniqueKeys
    }

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
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return orderKey.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyView.historyTableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryCell
        let order = displayOrder[indexPath.section]
        cell.shopNameLabel.text = order.shopName
        // Set the desired format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let formattedDate = dateFormatter.string(from: order.orderDate)
        cell.dateLabel.text = formattedDate
        cell.totalPriceLabel.text = "\(order.totalPrice)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = displayOrder[indexPath.section]
        let detailHistoryVC = DetailHistoryViewController()
        detailHistoryVC.photo = selectedCell.menuImage
        detailHistoryVC.shopName = selectedCell.shopName
        detailHistoryVC.date = selectedCell.orderDate
        detailHistoryVC.totalPrice = selectedCell.totalPrice
        detailHistoryVC.items = selectedCell.orderItems
        
        print("Selected cell of \(selectedCell)")
        let detailHistoryNavController = UINavigationController(rootViewController: detailHistoryVC)
        present(detailHistoryNavController, animated: true)
    }
}
