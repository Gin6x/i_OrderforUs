//
//  RecordViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 28/7/2023.
//

import UIKit
import MessageUI

class RecordViewController: UIViewController, UINavigationControllerDelegate {
    
    let recordView = RecordView()
    let orderVC = OrderViewController()

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
        //display mail composer
        displayMailComposer()
//        dismiss(animated: true)
    }
    
    func displayMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            // Show error alert informing the user their devices cannot use the mail composer
            return
        }
        let mailcompserVC = MFMailComposeViewController()
        mailcompserVC.delegate = self
        mailcompserVC.mailComposeDelegate = self
        //set field
        mailcompserVC.setToRecipients(emails)
        mailcompserVC.setSubject("Your order in \(shopname[0])")
        let mailGreeting = "Greeting everyone, \n\n \(names[0]) have paid a total of \(totalPrice[0]) for the order in \(shopname[0]), order detail are as follow: \n \n"
        var orderListBody = ""
        let mailEnding = "\nPlease check the detail of your order and enjoy!\n\n Kind regards, \n \(names[0])"
        for index in 0..<names.count {
            let name = names[index]
            let item = items[index]
            let price = prices[index]
            orderListBody += "\(name) ordered \(item) for \(price)\n"
        }
        let mailTemplate = mailGreeting + orderListBody + mailEnding
        mailcompserVC.setMessageBody(mailTemplate, isHTML: false)
        self.present(mailcompserVC, animated: true, completion: nil)
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
        } else if section == 1 {
            return "Your item"
        } else if section > 1 {
            let numberOfSections = names.count + 1
            var headerTitleArray: [String] = []
            for i in 2...numberOfSections {
                headerTitleArray.append("Item \(i)")
                print(headerTitleArray)
            }
            print(headerTitleArray)
            return headerTitleArray[section - 2]
        }
        return " "
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

extension RecordViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            //Show error alert to user
            return
        }
        
        switch result {
        case .cancelled:
            print("cancel pressed")
            break
        case .saved:
            print("save pressed")
            break
        case .sent:
            print("Mail sent")
            break
        case .failed:
            print("failed to send")
            break
        @unknown default:
            dismiss(animated: true)
        }
        controller.dismiss(animated: true)
    }
}

