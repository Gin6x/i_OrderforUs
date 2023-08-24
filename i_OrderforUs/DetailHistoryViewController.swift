//
//  DetailHistoryViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 15/8/2023.
//

import UIKit

class DetailHistoryViewController: UIViewController {
    
    private let detailHistoryView = DetailHistoryView()
    var order: Order?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailHistoryView
        title = "Order Detail"
        setData()
        detailHistoryView.detailHistoryTableView.delegate = self
        detailHistoryView.detailHistoryTableView.dataSource = self
    }
    
    func setData() {
        
        guard let selectedOrder = order else {
            print("order data not receive")
            return
        }
        detailHistoryView.photoImageView.image = loadImageFromDisk()
        detailHistoryView.shopNameLabel.text = selectedOrder.shopName
        //Convert data
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        detailHistoryView.dateLabel.text = formatter.string(from: selectedOrder.orderDate)
        //Convert decimal to string
        let totalPriceInString = String(describing: selectedOrder.totalPrice)
        detailHistoryView.totalPriceLabel.text = "£\(totalPriceInString)"
    }
    
    func loadImageFromDisk() -> UIImage? {
        //load image with URL from disk
        if let selectedOrder = order {
            do {
                let imageData = try Data(contentsOf: selectedOrder.menuImage!)
                return UIImage(data: imageData)!
            } catch {
                print("Error loading image : \(error)")
            }
        }
        return nil
    }
}

extension DetailHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return order?.orderItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Item \(section + 1)"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 33.0
        } else if section >= 1 {
            return 15.0
        }
        return 15.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let itemCell = detailHistoryView.detailHistoryTableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
        if let order = order {
            let item = order.orderItems[indexPath.section]
            itemCell.customerNameLabel.text = item.customerName
            itemCell.itemLabel.text = item.item
            let priceInString = String(describing: item.price)
            itemCell.priceLabel.text = "£\(priceInString)"
            itemCell.emailLabel.text = item.email
            return itemCell
        }
        fatalError("no item cell found")
    }
}


