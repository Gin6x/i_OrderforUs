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
        historyView.historyTableView.allowsSelection = true
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailHistoryVC = DetailHistoryViewController()
        if let orders = savedOrdersArray {
            let order = orders[indexPath.row]
            detailHistoryVC.order = order
            print("The selected contains:\(detailHistoryVC.order)")
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        let detailHistoryNavController = UINavigationController(rootViewController: detailHistoryVC)
        detailHistoryNavController.modalPresentationStyle = .automatic
        present(detailHistoryNavController, animated: true)
    }
    
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//            if let savedOrderArray = savedOrdersArray {
//                savedOrdersArray!.remove(at: indexPath.row)
//                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)
//                historyView.historyTableView.reloadData()
//            }
//        }
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
