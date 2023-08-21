//
//  FormViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 18/8/2023.
//

import UIKit

protocol FormViewControllerDelegate {
    func userDidInputData(restaurantName: String?, customerName: String, item: String, currency: String, price: String, email: String)
}

class FormViewController: UIViewController {
    let formView = FormView()
    let currencies = ["£", "$", "€"]
    var selectedCurrency = "£"
    var shopname: String?
    var haveShopName: Bool?
    var savedUsers: User?
        
    var delegate:FormViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = formView
        self.title = "Add Item"
        
        formView.currencyPickerView.delegate = self
        formView.currencyPickerView.dataSource = self
        formView.customerNameTextField.delegate = self
        
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        navigationItem.leftBarButtonItem = cancelBarButton
        
        let saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        navigationItem.rightBarButtonItem = saveBarButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if haveShopName == true {
            formView.shopNameTextField.isHidden = true
        }
    }
    
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
//        loadUserDataFromUserDefault()
    }
    
    @objc func saveButtonTapped() {
        
        if let shopnameInput = formView.shopNameTextField.text {
            shopname = shopnameInput
        }
        
        if let nameInput = formView.customerNameTextField.text,
           let itemInput = formView.itemTextField.text,
           let priceInput = formView.priceTextField.text,
           let emailInput = formView.emailTextField.text {
            print(shopname)
            print(nameInput)
            print(itemInput)
            print(priceInput)
            print(emailInput)
            print(selectedCurrency)
            
            delegate?.userDidInputData(restaurantName: shopname, customerName: nameInput, item: itemInput, currency: selectedCurrency, price: priceInput, email: emailInput)
        }
        
        dismiss(animated: true)
    }
    
    func loadUserDataFromUserDefault() {

        if let savedUserData = UserDefaults.standard.data(forKey: "savedUsers") {
            let decoder = JSONDecoder()
            do {
                let loadedUser = try decoder.decode(User.self, from: savedUserData)
                print(loadedUser)
                print(loadedUser.userInfo.count)
                savedUsers = loadedUser
                print("Saved user is \(savedUsers)")
            } catch {
                print("Error decoding the order:", error)
            }
        }
    }
    
}

extension FormViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            // Return the title for a specific row in the picker view.
            return currencies[row]
        }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return selectedCurrency = currencies[row]
    }
}

extension FormViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == 1 {
            loadUserDataFromUserDefault()
            if let userEmail = savedUsers?.userInfo[textField.text!] {
                formView.emailTextField.text = userEmail
            }
        }
    }
    
}


