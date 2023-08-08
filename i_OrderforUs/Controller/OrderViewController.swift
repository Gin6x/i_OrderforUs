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
    var numberOfSection = 2
    var headerTitle = ["Item 1"]
    //OrderData
    private var shopname: String = ""
    private var orderDate = Date()
    private var names: [String] = []
    private var items: [String] = []
    private var prices: [Double] = []
    private var totalPrice: String = ""
    private var emails: [String] = []
    private var selectedImage: UIImage?
    
    var newOrder: OrderData?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Order"
        self.view = orderView
//        orderView.nextButton.isEnabled = false
//        print("next button is now disable")
        
        orderView.orderTableView.delegate = self
        orderView.orderTableView.dataSource = self
        orderView.orderTableView.register(OrderCell.self, forCellReuseIdentifier: "orderCell")
        orderView.orderTableView.register(ItemCell.self, forCellReuseIdentifier: "itemCell")
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
//        orderView.orderTableView.estimatedRowHeight = 300.0
//        orderView.orderTableView.rowHeight = UITableView.automaticDimension
        
        let leftBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = leftBarButton
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = rightBarButton
        
        orderView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc func nextButtonTapped() {
        
        let recordVC = RecordViewController()
        if !(shopname.isEmpty || names.isEmpty || items.isEmpty || prices.isEmpty || emails.isEmpty) {
            print("All arrays have valid inputs.")
//            orderView.nextButton.isEnabled = true
            calTotalPrice()
            newOrder = OrderData(shopName: shopname, name: names, item: items, price: prices, totalPrice: totalPrice, email: emails)
            print("\(newOrder)")
            recordVC.newOrderData = newOrder
            recordVC.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(recordVC, animated: true)
        } else {
//            orderView.nextButton.backgroundColor = .systemRed
//            orderView.nextButton.isEnabled = false
            print("next button is now disable")
        }
    }
    
    @objc func cancelButtonTapped() {
        
        print("OrderVC dismissed")
        dismiss(animated: true)
    }
    
    @objc func addButtonTapped() {
        
        numberOfSection += 1
        
        let newTitle = "Item \(headerTitle.count + 1)"
        headerTitle.append(newTitle)
        print(headerTitle)

        let indexSet = IndexSet(integer: numberOfSection - 1)
        orderView.orderTableView.beginUpdates()
        orderView.orderTableView.insertSections(indexSet, with: .automatic)
        orderView.orderTableView.endUpdates()
        print("added new item")
    }
    
    func calTotalPrice() {
        let total = prices.reduce(0, +)
        let totalInStr = String(total)
        totalPrice = totalInStr
        print(totalPrice)
    }
    
    @objc func showKeyboard(notification: Notification) {
        
        if let userInfo = notification.userInfo,
           let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height - 20, right: 0)
            orderView.orderTableView.contentInset = contentInsets
            orderView.orderTableView.scrollIndicatorInsets = contentInsets
        }
    }
    
    @objc func hideKeyboard(notification: Notification) {
        orderView.orderTableView.contentInset = .zero
        orderView.orderTableView.scrollIndicatorInsets = .zero
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderCell
            cell.menuTextField.delegate = self
            cell.menuTextField.tag = 1
            cell.setImageButton.addTarget(self, action: #selector(setImageButtonPressed), for: .touchUpInside)
            if let userPhoto = selectedImage {
                cell.photoImageView.image = userPhoto
            }
            return cell
        } else if indexPath.section >= 1 {
            let itemCell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
            itemCell.nameTextField.delegate = self
            itemCell.itemTextField.delegate = self
            itemCell.priceTextField.delegate = self
            itemCell.emailTextField.delegate = self
            itemCell.nameTextField.tag = 2
            itemCell.itemTextField.tag = 3
            itemCell.priceTextField.tag = 4
            itemCell.emailTextField.tag = 5
            return itemCell
        }
        fatalError("Can not return cell")
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
}

extension OrderViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 1:
            if textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true {
                print("shop name is empty or only contain whitespace")
            } else if let restaurantName = textField.text {
                shopname = restaurantName
                print(shopname)
            } else if shopname.count > 1 {
                if let newInput = textField.text {
                    shopname = newInput
                    print(shopname)
                }
            }
            break

        case 2:
            if textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true {
                print("name is empty or only contain whitespace")
            } else if let name = textField.text {
                names.append(name)
                print(names)
            }
            break

        case 3:
            if textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true {
                print("item is empty or only contain whitespace")
            } else if let item = textField.text {
                items.append(item)
                print(items)
            }
            break

        case 4:

            if let price = textField.text, let priceDouble = Double(price) {
                prices.append(priceDouble)
                print(prices)
            } else {
                print("content cannot be convert to a double")
            }
            break

        case 5:

            func isValidEmail(email: String) -> Bool {
                // Regular expression pattern for email validation
                let emailRegex = "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

                do {
                    let regex = try NSRegularExpression(pattern: emailRegex)
                    let range = NSRange(location: 0, length: email.utf16.count)
                    let matches = regex.numberOfMatches(in: email, range: range)
                    return matches > 0
                } catch {
                    return false
                }
            }

            if let email = textField.text {
                if isValidEmail(email: email) {
                    emails.append(email)
                    print(emails)
                } else {
                    print("input is not a valid email address")
                }
            }
            break

        default:
            fatalError("No value")
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
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




