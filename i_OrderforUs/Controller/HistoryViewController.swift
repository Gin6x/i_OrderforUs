//
//  HistoryViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 9/8/2023.
//

import UIKit

class HistoryViewController: UIViewController {
    
    let historyView = HistoryView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "History"
        self.view = historyView
        
        historyView.historyTableView.delegate = self
        historyView.historyTableView.dataSource = self
        historyView.historyTableView.register(HistoryCell.self, forCellReuseIdentifier: "historyCell")
    }
    

  

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
