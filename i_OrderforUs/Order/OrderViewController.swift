//
//  OrderViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 16/5/2023.
//

import UIKit
import NotificationCenter
import MessageUI

class OrderViewController: UIViewController, FormViewControllerDelegate, EditFormViewControllerDelegate, HistoryViewControllerDelegate {

    private let orderView = OrderView()
    private var newOrderItems: [OrderItem] = []
    private var selectedSection: Int?
    private let defaults = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Order"
        self.view = orderView
        orderView.shopNameTextField.delegate = self
        orderView.orderTableView.delegate = self
        orderView.orderTableView.dataSource = self
        
        let leftBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveOrder))
        navigationItem.rightBarButtonItem = rightBarButton
        
        orderView.addItemButton.addTarget(self, action: #selector(addItem), for: .touchUpInside)
        orderView.setImageButton.addTarget(self, action: #selector(setImage), for: .touchUpInside)
    }
    
    @objc func cancel() {
        dismiss(animated: true)
    }
    
    @objc func saveOrder() {
        
        guard let shopName = orderView.shopNameTextField.text else {
            print("There is no shop name, can't write new order")
            return
        }
        
        var imageURL: URL?
        var savedOrdersArray: [Order]
        
        // Convert image to Data
        if let data = orderView.photoImageView.image?.pngData() {
            // Create URL
            let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let url = documents.appendingPathComponent("\(String(describing: orderView.shopNameTextField.text)).png")
            do {
                // Write to Disk
                try data.write(to: url)
                imageURL = url
            } catch {
                print("Unable to Write Data to Disk (\(error))")
            }
        }
        
        //Check if there are any saved orders and load the saved order array
        if let savedOrders = defaults.data(forKey: "savedOrders"),
           let decodedOrders = try? JSONDecoder().decode([Order].self, from: savedOrders) {
            savedOrdersArray = decodedOrders
            
            //Create new order object and save into saved orders
            let newOrder = Order(menuImage: imageURL, shopName: shopName, orderItems: newOrderItems)
            savedOrdersArray.append(newOrder)
            mailCompose(order: newOrder)
            print("Updated saved orders are as following: \(savedOrdersArray)")
            do { // Save the updated saved order array to userDefault
                
                let encoder = JSONEncoder()
                let encodedData = try encoder.encode(savedOrdersArray)
                defaults.set(encodedData, forKey: "savedOrders")
            } catch {
                print("Error encoding the order:", error)
            }
            print("Saved orders updated")
        } else { //if there is no saved order, create new saved order array and save it into userDefaults
            if !newOrderItems.isEmpty {
                let newOrder = Order(menuImage: imageURL, shopName: shopName, orderItems: newOrderItems)
                var orderArray: [Order] = []
                orderArray.append(newOrder)
                mailCompose(order: newOrder)
                print("Order array contain: \(orderArray)")
                do {
                    let encoder = JSONEncoder()
                    let encodedData = try encoder.encode(orderArray)
                // Save the encoded data to userDefault
                    defaults.set(encodedData, forKey: "savedOrders")
                    print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
                } catch {
                    print("Error encoding the order:", error)
                }
                print("Order saved")
            }
            print("No order item")
        }
    }
    
    @objc func addItem() {
        print("add new item")
        let formVC = FormViewController()
        formVC.delegate = self
        let formNavController = UINavigationController(rootViewController: formVC)
        formNavController.modalPresentationStyle = .automatic
        present(formNavController, animated: true)
    }
    
    //Delegate for FormVC
    func addedNewItem(orderItem: OrderItem) {
        let currentItem = orderItem
        newOrderItems.append(currentItem)
        print("New order items contains: \(newOrderItems)")
        if newOrderItems.count >= 1 {
            orderView.noDataLabel.isHidden = true
        }
        let newSectionIndex = newOrderItems.count - 1
        let indexSet = IndexSet(integer: newSectionIndex)
        orderView.orderTableView.beginUpdates()
        orderView.orderTableView.insertSections(indexSet, with: .automatic)
        orderView.orderTableView.endUpdates()
        orderView.orderTableView.reloadData()
    }
    
    //Update existing cell for FormVC delegate
    func addedUpdatedItem(orderItem: OrderItem) {
        let updatedItem = orderItem
        if let selectedSection = selectedSection {
            newOrderItems[selectedSection] = updatedItem
            print("The updated order item array now contain: \(newOrderItems)")
            orderView.orderTableView.reloadData()
        }
    }
    
    //Delete section delegate from FormVC
    func deleteSection(remove: Bool) {
        if remove == true {
            if let selectedSection = selectedSection {
                newOrderItems.remove(at: selectedSection)
                orderView.orderTableView.deleteSections(IndexSet(integer: selectedSection), with: .automatic)
                orderView.orderTableView.reloadData()
            }
        }
    }
    
    //Re-order delegate from HistoryVC
    func reOrder(order: Order) {
        
        let selectedOrder = order
        orderView.shopNameTextField.text = selectedOrder.shopName
        for item in selectedOrder.orderItems {
            newOrderItems.append(item)
            print("\(newOrderItems)")
        }
        //set photoImage if found
        if let orderImage = selectedOrder.menuImage {
            do {
                let imageData = try Data(contentsOf: orderImage)
                orderView.photoImageView.image = UIImage(data: imageData)
            } catch {
                print("Error loading image : \(error)")
            }
        }
//        orderView.orderTableView.reloadData()
        print("Re-ordered")
    }
    
    func mailCompose(order: Order) {

        guard MFMailComposeViewController.canSendMail() else {
            // Show error alert informing the user their devices cannot use the mail composer
            return
        }
        //turn price in array of String into array of Int
        let totalPriceInString = String(describing: order.totalPrice)
        let mailcompserVC = MFMailComposeViewController()
        mailcompserVC.delegate = self
        mailcompserVC.mailComposeDelegate = self
        //set field
        let greeting = "Greeting everyone, \n\n \(newOrderItems[0].customerName) have paid a total of £\(order.totalPrice) for the order in \(order.shopName), order detail are as follow: \n \n"
        let ending = "\nPlease check the detail of your order and enjoy!\n\n Kind regards, \n \(newOrderItems[0].customerName)"
        var orderBody = ""
        var receiptents: [String] = []
        for orderItem in newOrderItems {
            orderBody += "\(orderItem.customerName) ordered \(orderItem.item) for £\(orderItem.price)\n"
            receiptents.append(orderItem.email)
        }
        let mailTemplate = greeting + orderBody + ending
        if let attachImage = orderView.photoImageView.image?.pngData() {
            mailcompserVC.addAttachmentData(attachImage, mimeType: "application/jpg", fileName: "\(String(describing: orderView.shopNameTextField.text)).png")
        }
        mailcompserVC.setMessageBody(mailTemplate, isHTML: false)
        mailcompserVC.setToRecipients(receiptents)
        mailcompserVC.setSubject("Your order in \(order.shopName)")
        self.present(mailcompserVC, animated: true, completion: nil)
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return newOrderItems.count 
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Your item"
        }
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
        
        let itemCell = orderView.orderTableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
        let item = newOrderItems[indexPath.section]
        itemCell.customerNameLabel.text = item.customerName
        itemCell.itemLabel.text = item.item
        let priceInString = String(describing: item.price)
        itemCell.priceLabel.text = "£\(priceInString)"
        itemCell.emailLabel.text = item.email
        return itemCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let editformVC = EditFormViewController()
        editformVC.delegate = self
        let item = newOrderItems[indexPath.section]
        selectedSection = indexPath.section
        editformVC.selecteditem = item
        print("Current selected item is as follow: \(item)")
        let editformNavController = UINavigationController(rootViewController: editformVC)
        editformNavController.modalPresentationStyle = .automatic
        present(editformNavController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            newOrderItems.remove(at: indexPath.section)
            tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)
            orderView.orderTableView.reloadData()
        }
    }
}

extension OrderViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {

        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = sourceType
        return imagePickerVC
    }

    @objc func setImage() {

        let pickPhotoAlertVC = UIAlertController(title: "Menu upload", message: "Please choose a photo for the menu / receipt", preferredStyle: .actionSheet)

        let pickCamera = UIAlertAction(title: "Camera", style: .default) { (action) in
            let cameraPhotoPicker = self.imagePicker(sourceType: .camera)
            cameraPhotoPicker.delegate = self
            self.present(cameraPhotoPicker, animated: true) {
                print("Picked camera as photo source")
            }
        }

        let pickLibrary = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            let libraryPhotoPicker = self.imagePicker(sourceType: .savedPhotosAlbum)
            libraryPhotoPicker.delegate = self
            self.present(libraryPhotoPicker, animated: true){
                print("Picked photo album as photo source")
            }
        }

        let cancelPhotoSelection = UIAlertAction(title: "cancel", style: .cancel)
        pickPhotoAlertVC.addAction(pickCamera)
        pickPhotoAlertVC.addAction(pickLibrary)
        pickPhotoAlertVC.addAction(cancelPhotoSelection)
        self.present(pickPhotoAlertVC, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedPhoto = info[.originalImage] as? UIImage {
            orderView.photoImageView.image = selectedPhoto
            picker.dismiss(animated: true)
        }
    }
}

extension OrderViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let currentShopName = textField.text {
            orderView.shopNameTextField.text = currentShopName
        }
        textField.resignFirstResponder()
        return true
    }
}

extension OrderViewController: MFMailComposeViewControllerDelegate {

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
