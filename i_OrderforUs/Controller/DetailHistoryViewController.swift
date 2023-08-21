//
//  DetailHistoryViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 15/8/2023.
//

import UIKit

class DetailHistoryViewController: UIViewController {
    
    let detailHistoryView = DetailHistoryView()
    var photo: URL?
    var shopName: String?
    var date: Date?
    var totalPrice: Decimal?
    var items: [OrderItem]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailHistoryView
        title = "Order Detail"
        
        detailHistoryView.detailHistoryTableView.delegate = self
        detailHistoryView.detailHistoryTableView.dataSource = self
        detailHistoryView.detailHistoryTableView.register(DetailHistoryCell.self, forCellReuseIdentifier: "detailHistoryCell")
        detailHistoryView.detailHistoryTableView.register(ItemCell.self, forCellReuseIdentifier: "itemCell")
        
//        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backButtonPressed))
        
        
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonPressed))
        self.navigationItem.leftBarButtonItem = cancelButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        func loadImageFromURL(_ url: URL) -> UIImage? {
            guard let display = photo else {
                print("No photo data")
                return nil
            }
            do {
                let data = try Data(contentsOf: display)
                return UIImage(data: data)
            } catch {
                print("Error loading image:", error)
                        return nil
            }
        }
        
        detailHistoryView.detailHistoryTableView.reloadData()
    }
    
    func loadImageFromURL(_ url: URL) -> UIImage? {
        guard let display = photo else {
            print("No photo data")
            return nil
        }
        do {
            let data = try Data(contentsOf: display)
            return UIImage(data: data)
        } catch {
            print("Error loading image:", error)
                    return nil
        }
    }
    
    func getItemHeaderTitle() -> [String] {
        var itemTitle: [String] = []
        var counter = 1
        
        while true {
            let title = "Item\(counter)"
            
            if counter > items!.count {
                break
            }
            itemTitle.append(title)
            counter += 1
        }
        return itemTitle
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true)
    }
}

extension DetailHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section >= 1 {
            return 1
        }
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return items!.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 30.0
        } else if section >= 1 {
            return 15.0
        }
        return 15.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 85.0
        } else if indexPath.section >= 1 {
            return 150.0
        }
        
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let displayItemTitle = getItemHeaderTitle()

        if section == 0 {
            return "Menu / Receipt"
        } else if section >= 1 {
            return displayItemTitle[section - 1]
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = detailHistoryView.detailHistoryTableView.dequeueReusableCell(withIdentifier: "detailHistoryCell", for: indexPath) as! DetailHistoryCell
            DispatchQueue.main.async {
                cell.photoImageView.image = UIImage(named: "camera.svg")
            }
            if let displayphoto = photo {
                DispatchQueue.main.async {
                    cell.photoImageView.image = self.loadImageFromURL(displayphoto)
                }
            }
            
            if let displayShopName = shopName,
               let displayDate = date,
               let displayTotalPrice = totalPrice {
                cell.shopNameLabel.text = displayShopName
                cell.dateLabel.text = "\(displayDate)"
                cell.totalPriceLabel.text = "\(displayTotalPrice)"
            }
            return cell
        } else if indexPath.section >= 1 {
            let itemCell = detailHistoryView.detailHistoryTableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
            itemCell.emailLabel.isHidden = true
            itemCell.emailDataLabel.isHidden = true
            if let displayItems = items {
                let sectionItem = displayItems[indexPath.section - 1]
                itemCell.customerNameDataLabel.text = sectionItem.customerName
                itemCell.itemDataLabel.text = sectionItem.item
                itemCell.priceDataLabel.text = "\(sectionItem.price)"
                itemCell.currencyLabel.text = sectionItem.currency
            }
            return itemCell
        }
        fatalError("cell are not in display")
    }
}
