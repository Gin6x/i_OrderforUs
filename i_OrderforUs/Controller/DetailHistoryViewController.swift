//
//  DetailHistoryViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 15/8/2023.
//

import UIKit

class DetailHistoryViewController: UIViewController {
    
    let detailHistoryView = DetailHistoryView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = detailHistoryView
        
        detailHistoryView.detailHistoryTableView.delegate = self
        detailHistoryView.detailHistoryTableView.dataSource = self
        detailHistoryView.detailHistoryTableView.register(DetailHistoryCell.self, forCellReuseIdentifier: "detailHistoryCell")
        detailHistoryView.detailHistoryTableView.register(ItemCell.self, forCellReuseIdentifier: "itemCell")
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
        return 2
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
            return 210
        }
        
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        if section == 0 {
            return "Menu / Receipt"
        } else if section >= 1 {
            return "Item"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = detailHistoryView.detailHistoryTableView.dequeueReusableCell(withIdentifier: "detailHistoryCell", for: indexPath) as! DetailHistoryCell
            return cell
        } else if indexPath.section >= 1 {
            let itemCell = detailHistoryView.detailHistoryTableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
            return itemCell
        }
        fatalError("cell are not in display")
    }
}
