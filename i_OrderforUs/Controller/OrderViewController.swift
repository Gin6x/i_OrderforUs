//
//  OrderViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 16/5/2023.
//

import UIKit
import NotificationCenter
import MessageUI

class OrderViewController: UIViewController, FormViewControllerDelegate {

    let orderView = OrderView()
    var numberOfSection = 1
    var headerTitle = ["Item 1"]

    let defaults = UserDefaults()
    private var selectedImage: UIImage?
    var photoURL: URL?
    private var displayShopName: String = ""
    private var displayCurrency: String = ""
    private var displayCustomerName: [String] = []
    private var displayItem: [String] = []
    private var displayPrice: [String] = []
    private var displayEmail: [String] = []
    private var displayItemsArray: [OrderItem] = []
    private var newUsers: [String: String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Order"
        self.view = orderView
        
        orderView.orderTableView.delegate = self
        orderView.orderTableView.dataSource = self
        orderView.orderTableView.allowsSelection = true
        orderView.orderTableView.register(OrderCell.self, forCellReuseIdentifier: "orderCell")
        orderView.orderTableView.register(ItemCell.self, forCellReuseIdentifier: "itemCell")

        let leftBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButton
        

        orderView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    func getUniqueOrderKey() -> String {
        var counter = 1
        var uniqueKey = "savedOrder\(counter)"
        
        while UserDefaults.standard.object(forKey: uniqueKey) != nil {
            counter += 1
            uniqueKey = "savedOrder\(counter)"
        }
        
        return uniqueKey
    }
    
    @objc func nextButtonTapped() {
        let uniqueOrderKey = getUniqueOrderKey()
        
        if let photo = selectedImage {
            photoURL = saveImageToDisk(image: photo, name: "\(uniqueOrderKey)photo")
            print(photoURL)
        }
        
        //Create new Order object and save to userDefault
        
        let newOrder = Order(menuImage: photoURL, shopName: displayShopName, currency: displayCurrency, orderItems: displayItemsArray)
        print(newOrder)
        print("The total price is \(newOrder.totalPrice)")
        
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(newOrder)
            
        // Save the encoded data to userDefault
            defaults.set(encodedData, forKey: uniqueOrderKey)
            print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
        } catch {
            print("Error encoding the order:", error)
        }
        
        //need to create savedUser in userDefaults with struct of User
        for i in 0..<displayCustomerName.count {

            newUsers[displayCustomerName[i]] = displayEmail[i]
            print(newUsers)
            print("There are \(newUsers.count) new users in the dictionary")
        }
        
        var savedUser = User()
        savedUser.userInfo = newUsers
        
        do {
            let encoder = JSONEncoder()
            let encodedData = try encoder.encode(savedUser)
            
            // Save the encoded data to userDefault
            defaults.set(encodedData, forKey: "savedUsers")
            print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))
        } catch {
            print("Error encoding the order:", error)
        }
        
        
//        displayMailComposer()
    }
    
    @objc func addButtonTapped() {
        let formVC = FormViewController()
        formVC.delegate = self
        formVC.haveShopName = doesShopNameExist()
        let formNavController = UINavigationController(rootViewController: formVC)
        present(formNavController, animated: true)
    }
    
    func doesShopNameExist() -> Bool {
        if !displayShopName.isEmpty {
            return true
        }
        return false
    }
    
    func userDidInputData(restaurantName: String?, customerName: String, item: String, currency: String, price: String, email: String) {
        
        if displayShopName.isEmpty {
            if let shopName = restaurantName{
                displayShopName = shopName
            }
        }
        displayCustomerName.append(customerName)
        displayItem.append(item)
        displayPrice.append(price)
        displayEmail.append(email)
        displayCurrency = currency
        print(displayShopName)
        print(displayCustomerName)
        print(displayItem)
        print(displayCurrency)
        print(displayPrice)
        print(displayEmail)
//        Insert new cell
        numberOfSection += 1
        let newTitle = "Item \(headerTitle.count + 1)"
        headerTitle.append(newTitle)

        let indexSet = IndexSet(integer: numberOfSection - 1)
        orderView.orderTableView.beginUpdates()
        orderView.orderTableView.insertSections(indexSet, with: .automatic)
        orderView.orderTableView.endUpdates()
        print("added new item")
        print("There are \(numberOfSection) section")

        //add new order and use next button to save to userDefault
        if let decimalPrice = Decimal(string: price){
            let newOrderItem = OrderItem(customerName: customerName, item: item, currency: displayCurrency, price: decimalPrice, email: email)
            displayItemsArray.append(newOrderItem)

            print(displayItemsArray)
//            print(user)
        }
        orderView.orderTableView.reloadData()
    }
    
    @objc func cancelButtonTapped() {
        print("OrderVC dismissed")
        dismiss(animated: true)
    }
    
    func displayMailComposer() {
        
        guard MFMailComposeViewController.canSendMail() else {
            // Show error alert informing the user their devices cannot use the mail composer
            return
        }
        //turn price in array of String into array of Int
        let priceIntArray = displayPrice.compactMap { Int($0) }
        let totalPrice = priceIntArray.reduce(0) { $0 + $1 }
        
        let mailcompserVC = MFMailComposeViewController()
        mailcompserVC.delegate = self
        mailcompserVC.mailComposeDelegate = self
        //set field
        mailcompserVC.setToRecipients(displayEmail)
        mailcompserVC.setSubject("Your order in \(displayShopName)")
        let mailGreeting = "Greeting everyone, \n\n \(displayCustomerName[0]) have paid a total of \(totalPrice) for the order in \(displayShopName)), order detail are as follow: \n \n"
        var orderListBody = ""
        let mailEnding = "\nPlease check the detail of your order and enjoy!\n\n Kind regards, \n \(displayCustomerName[0])"
        for index in 0..<(displayCustomerName.count) {
            let name = displayCustomerName[index]
            let item = displayItem[index]
            let price = displayPrice[index]
            orderListBody += "\(name) ordered \(item) for \(price)\n"
        }
        let mailTemplate = mailGreeting + orderListBody + mailEnding
        mailcompserVC.setMessageBody(mailTemplate, isHTML: false)
        self.present(mailcompserVC, animated: true, completion: nil)
    }
    
    func saveImageToDisk (image: UIImage, name: String) -> URL? {
        if let data = image.jpegData(compressionQuality: 1.0),
           let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent(name + ".jpeg") {
            do {
                try data.write(to: url)
                return url
            } catch {
                print("Error in saving image:", error)
                return nil
            }
        }
        return nil
    }
}

extension OrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section >= 1 {
            return 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 85.0
        } else if indexPath.section >= 1 {
            return 210
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        if section == 0 {
            return "Menu / Receipt"
        } else if section == 1{
            return "Your item"
        } else if section > 1 {
            return headerTitle[section - 1]
        }
        return ""
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSection
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section >= 1 {
            return .delete
        }
        return .none
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section >= 1 {
                let adjustedIndex = indexPath.section - 1
    
                displayCustomerName.remove(at: adjustedIndex)
                displayItem.remove(at: adjustedIndex)
                displayPrice.remove(at: adjustedIndex)
                displayEmail.remove(at: adjustedIndex)
                displayItemsArray.remove(at: adjustedIndex)
                numberOfSection -= 1
                print(displayCustomerName)
                print(displayItem)
                print(displayPrice)
                print(displayEmail)
                print(displayItemsArray)
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)
                orderView.orderTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = orderView.orderTableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderCell
            if !displayShopName.isEmpty {
                cell.shopDataLabel.text = displayShopName
            }
            cell.setImageButton.addTarget(self, action: #selector(setImageButtonPressed), for: .touchUpInside)
            if let displayImage = selectedImage {
                cell.photoImageView.image = displayImage
            }
            return cell
        } else if indexPath.section >= 1 {
            let itemCell = orderView.orderTableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
            itemCell.customerNameDataLabel.text = displayCustomerName[indexPath.section - 1]
            itemCell.itemDataLabel.text = displayItem[indexPath.section - 1]
            itemCell.priceDataLabel.text = displayPrice[indexPath.section - 1]
            itemCell.currencyLabel.text = displayCurrency
            itemCell.emailDataLabel.text = displayEmail[indexPath.section - 1]
            return itemCell
        }
        
        fatalError("cell are not in display")
    }
}

extension OrderViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = sourceType
        imagePickerVC.delegate = self
        return imagePickerVC
    }
    
    @objc func setImageButtonPressed() {
        
        let pickPhotoAlertVC = UIAlertController(title: "Menu upload", message: "Please choose a photo for the menu / receipt", preferredStyle: .actionSheet)
        
        let pickCamera = UIAlertAction(title: "Camera", style: .default) { (action) in
            
            let cameraPhotoPicker = self.imagePicker(sourceType: .camera)
            self.present(cameraPhotoPicker, animated: true) {
                print("Picked camera as photo source")
            }
        }
        
        let pickLibrary = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            
            let libraryPhotoPicker = self.imagePicker(sourceType: .savedPhotosAlbum)
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
            selectedImage = selectedPhoto
            orderView.orderTableView.reloadData()
            picker.dismiss(animated: true)
        }
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
