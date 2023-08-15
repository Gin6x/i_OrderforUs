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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
        self.view = historyView
        
        historyView.historyTableView.delegate = self
        historyView.historyTableView.dataSource = self
        historyView.historyTableView.register(HistoryCell.self, forCellReuseIdentifier: "historyCell")
        let orderKey = getOrderKey()
        print(orderKey)
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
        
        return uniqueKeys
    }
//    func loadDataFromUserDefault() {
//
//        let uniqueOrderKey = getUniqueOrderKey()
//
//        if let savedData = UserDefaults.standard.data(forKey: uniqueOrderKey) {
//            let decoder = JSONDecoder()
//            do {
//                let loadedOrder = try decoder.decode(Order.self, from: savedData)
//                print(loadedOrder)
//            } catch {
//                print("Error decoding the order:", error)
//            }
//        }
//    }
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = historyView.historyTableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath) as! HistoryCell
        return cell
    }
    
    
}
