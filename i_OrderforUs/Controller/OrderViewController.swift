//
//  OrderViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 16/5/2023.
//

import UIKit
import NotificationCenter

class OrderViewController: UIViewController {
    
    let orderView = OrderView()
    var numberOfSection = 1
    var headerTitle = ["Your Item"]
//    var orderCell: OrderCell?

    private var selectedImage: UIImage?
    private var displayShopName: String = ""
    private var displayCustomerName: String = ""
    private var displayItem: String = ""
    private var displayPrice: String = ""
    private var displayEmail: String = ""
//
//    var photoData: UIImage?
//    var shopNameData: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Order"
        self.view = orderView
        
        orderView.orderTableView.delegate = self
        orderView.orderTableView.dataSource = self
        orderView.orderTableView.register(OrderCell.self, forCellReuseIdentifier: "orderCell")
        orderView.orderTableView.register(ItemCell.self, forCellReuseIdentifier: "itemCell")
//        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
//        orderView.orderTableView.estimatedRowHeight = 300.0
//        orderView.orderTableView.rowHeight = UITableView.automaticDimension
        
        let leftBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButton
        

//        orderView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
//    @objc func nextButtonTapped() {
//
//        let recordVC = RecordViewController()
//        if !(shopname.isEmpty || names.isEmpty || items.isEmpty || prices.isEmpty || emails.isEmpty) {
//            print("All arrays have valid inputs.")
//            orderView.nextButton.isEnabled = true
//            calTotalPrice()
//            newOrder = OrderData(shopName: shopname, name: names, item: items, price: prices, totalPrice: totalPrice, email: emails)
//            print("\(newOrder)")
////            recordVC.newOrderData = newOrder
//            recordVC.modalPresentationStyle = .fullScreen
//            self.navigationController?.pushViewController(recordVC, animated: true)
//        } else {
//            orderView.nextButton.backgroundColor = .systemRed
//            orderView.nextButton.isEnabled = false
//            print("next button is now disable")
//        }
//    }
    
    @objc func cancelButtonTapped() {
        
        print("OrderVC dismissed")
        dismiss(animated: true)
    }
    
    @objc func addButtonTapped() {
        
        let addItemAC = UIAlertController(title: "Add new item", message: "Please add the following data for future usage", preferredStyle: .alert)
        
        if displayShopName.isEmpty {
            addItemAC.addTextField { textfield in
                textfield.placeholder = "Restaurant name"
                textfield.tag = 0
            }
        }
            addItemAC.addTextField { textfield in
                textfield.placeholder = "Your name"
                textfield.tag = 1
            }
            addItemAC.addTextField { textfield in
                textfield.placeholder = "Item"
                textfield.tag = 2
            }
            addItemAC.addTextField { textfield in
                textfield.placeholder = "Price"
                textfield.tag = 3
            }
            addItemAC.addTextField { textfield in
                textfield.placeholder = "Company / personal mail"
                textfield.tag = 4
            }
     
        let saveAction = UIAlertAction(title: "Save", style: .default) { [self] _ in
            
            if displayShopName.isEmpty {
                if let shopNameTextField = addItemAC.textFields?.first(where: { $0.tag == 0 }),
                   let shopName = shopNameTextField.text {
                    displayShopName = shopName
                }
            }
            
            if let customerNameTextField = addItemAC.textFields?.first(where: { $0.tag == 1 }),
               let itemTextField = addItemAC.textFields?.first(where: { $0.tag == 2 }),
               let priceTextField = addItemAC.textFields?.first(where: { $0.tag == 3 }),
               let emailTextField = addItemAC.textFields?.first(where: { $0.tag == 4 }),
               let customerName = customerNameTextField.text,
               let item = itemTextField.text,
               let price = priceTextField.text,
               let email = emailTextField.text {
                
                //Populate display variables
                displayCustomerName = customerName
                displayItem = item
                displayPrice = price
                displayEmail = email
                
                print(displayShopName)
                print(displayCustomerName)
                print(displayItem)
                print(displayPrice)
                print(displayEmail)
                
                
                numberOfSection += 1
                print(numberOfSection)
                let newTitle = "Item \(headerTitle.count + 1)"
                headerTitle.append(newTitle)
                print(headerTitle)
                
                let indexSet = IndexSet(integer: numberOfSection - 1)
                orderView.orderTableView.beginUpdates()
                orderView.orderTableView.insertSections(indexSet, with: .automatic)
                orderView.orderTableView.endUpdates()
                print("added new item")
                
                
                //add new order and save to userDefault
                if let decimalPrice = Decimal(string: price){
                    let newOrderItem = OrderItem(customerName: customerName, item: item, price: decimalPrice, email: email)
                    var newOrder: Order?
                    newOrder?.orderItems.append(newOrderItem)
                    print(newOrderItem)
                }
                orderView.orderTableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        addItemAC.addAction(saveAction)
        addItemAC.addAction(cancelAction)
        present(addItemAC, animated: true)
    }
}
    
//    @objc func showKeyboard(notification: Notification) {
//
//        if let userInfo = notification.userInfo,
//           let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height - 20, right: 0)
//            orderView.orderTableView.contentInset = contentInsets
//            orderView.orderTableView.scrollIndicatorInsets = contentInsets
//        }
//    }
//
//    @objc func hideKeyboard(notification: Notification) {
//        orderView.orderTableView.contentInset = .zero
//        orderView.orderTableView.scrollIndicatorInsets = .zero
//    }


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
        } else if section == 1 {
            return "Your Item"
        } else if section >= 1 {
            return headerTitle[section - 1]
        }
        return ""
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = orderView.orderTableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderCell
            cell.isUserInteractionEnabled = true
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
            itemCell.isUserInteractionEnabled = true
            itemCell.customerNameDataLabel.text = displayCustomerName
            itemCell.itemDataLabel.text = displayItem
            itemCell.priceDataLabel.text = displayPrice
            itemCell.emailDataLabel.text = displayEmail
            return itemCell
        }
        fatalError("cell are not in display")
    }
}

extension OrderViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let next = orderView.orderTableView.viewWithTag(textField.tag + 1) {
            next.becomeFirstResponder()
        }
        else{
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
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
        
//        let pickNoMenu = UIAlertAction(title: "I don't have a menu", style: .default) { (action) in
//            self.navigateToOrderVC()
//        }
        
        let cancelPhotoSelection = UIAlertAction(title: "cancel", style: .cancel)
        
        pickPhotoAlertVC.addAction(pickCamera)
        pickPhotoAlertVC.addAction(pickLibrary)
//        pickPhotoAlertVC.addAction(pickNoMenu)
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




