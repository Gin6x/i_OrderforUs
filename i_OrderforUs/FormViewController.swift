//
//  FormViewController.swift
//  i_OrderforUs
//
//  Created by Gin on 18/8/2023.
//

import UIKit

protocol FormViewControllerDelegate {
    func addedNewItem(orderItem: OrderItem)
    func addedUpdatedItem(orderItem: OrderItem)
}

class FormViewController: UIViewController {
    
    private let formView = FormView()
    var selecteditem: OrderItem?
        
    var delegate:FormViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = formView
        self.title = "Add Item"
        formView.customerNameTextField.delegate = self
        formView.itemTextField.delegate = self
        formView.itemTextField.delegate = self
        formView.priceTextField.delegate = self
        formView.emailTextField.delegate = self
        
        let cancelBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.leftBarButtonItem = cancelBarButton
        
        let saveBarButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveItem))
        navigationItem.rightBarButtonItem = saveBarButton
        
        formView.deleteButton.addTarget(self, action: #selector(deleteItem), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        editItem()
    }
    
    @objc func cancel() {
        dismiss(animated: true)
    }
    
    @objc func deleteItem() {
        print("Delete item")
    }
    
    func editItem() {
        
        guard let selectedItem = selecteditem else {
            print("No item is selected from orderVC's cell")
            return
        }
        formView.customerNameTextField.text = selectedItem.customerName
        formView.itemTextField.text = selectedItem.item
        formView.priceTextField.text = String(describing: selectedItem.price)
        formView.emailTextField.text = selectedItem.email
        formView.deleteButton.isHidden = false
    }
    
    //check if the email is valid
    func isValidEmail (_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    @objc func saveItem() {
        
        guard let name = formView.customerNameTextField.text, !name.isEmpty,
              let item = formView.itemTextField.text, !item.isEmpty,
              let price = formView.priceTextField.text, !price.isEmpty,
              let email = formView.emailTextField.text, !email.isEmpty else {
            print("User did not input all data fields")
            formView.warningLabel.text = "Please fill in all the text field"
            return
        }
        
        if formView.deleteButton.isHidden == false { //Perform addedUpdatedItem protocol if user is editing an existing cell as the delete button is shown
            
            if isValidEmail(email) == true {
                if let decimalPrice = Decimal(string: price) {
                    let updatedItem = OrderItem(customerName: name, item: item, price: decimalPrice, email: email)
                    print("The selected update item is as follow: \(updatedItem)")
                    delegate?.addedUpdatedItem(orderItem: updatedItem)
                    dismiss(animated: true)
                    return
                }
            } else {
                formView.warningLabel.text = "Invalid email"
            }
        }
        
        if isValidEmail(email) == true {
            if let decimalPrice = Decimal(string: price) {
                let newItem = OrderItem(customerName: name, item: item, price: decimalPrice, email: email)
                print("The new item are as follow: \(newItem)")
                delegate?.addedNewItem(orderItem: newItem)
                dismiss(animated: true)
            }
        } else {
            formView.warningLabel.text = "Invalid email"
        }
    }
}

extension FormViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


