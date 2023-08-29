//
//  HistoryViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 9/8/2023.
//

import UIKit

protocol HistoryViewControllerDelegate {
    func reOrder(order: Order)
}

class HistoryViewController: UIViewController {
    
    private let historyView = HistoryView()
    private var savedOrdersArray: [Order]?
    private let defaults = UserDefaults()
    var delegate:HistoryViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
        self.view = historyView
        historyView.historyTableView.delegate = self
        historyView.historyTableView.dataSource = self
        historyView.historyTableView.allowsSelection = true

        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        historyView.historyTableView.addGestureRecognizer(longPressRecognizer)
        
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
    
    @objc func longPress(sender: UILongPressGestureRecognizer) {
        if sender.state == UILongPressGestureRecognizer.State.began {
            
            let touchPoint = sender.location(in: historyView.historyTableView)
            if let indexPath = historyView.historyTableView.indexPathForRow(at: touchPoint) {
                
                let reOrderAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
                let reOrderAction = UIAlertAction(title: "Re-order", style: .default) { reOrderAction in
                    if let savedOrder = self.savedOrdersArray?[indexPath.row] {
                        self.delegate?.reOrder(order: savedOrder)
                        print("\(savedOrder)")
                        let tabBarController = self.navigationController?.tabBarController
                        tabBarController!.selectedIndex = 0
                        print("navigate to order tab")
                    }                  
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
                reOrderAlertController.addAction(reOrderAction)
                reOrderAlertController.addAction(cancelAction)
                self.present(reOrderAlertController, animated: true)
            }
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
        historyCell.isUserInteractionEnabled = true
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
}
