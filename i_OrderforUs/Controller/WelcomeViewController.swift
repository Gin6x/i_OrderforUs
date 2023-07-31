//
//  WelcomeViewContoller.swift
//  i_OrderforUs
//
//  Created by Gin on 8/5/2023.
//

import UIKit

class WelcomeViewController: UIViewController, UIImagePickerControllerDelegate {
    
    let welcomeView = WelcomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = welcomeView
        welcomeView.startOrderButton.addTarget(self, action: #selector(startButtonPressed) , for: .touchUpInside)
    }
    
    @objc func startButtonPressed() {
        imageOption()
    }
    
    // Directly navigate to OrderNavigationController when there's no menu
    func navigateToOrderVC() {
        let orderVC = OrderViewController()
        let orderNavController = UINavigationController(rootViewController: orderVC)
        orderNavController.modalPresentationStyle = .fullScreen
//        orderNavController.navigationBar.prefersLargeTitles = true
        self.present(orderNavController, animated: true, completion: nil)
    }
    
    func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        
        let imagePickerVC = UIImagePickerController()
        imagePickerVC.sourceType = sourceType
        return imagePickerVC
    }
    
    func imageOption() {
        
        let pickPhotoAlertVC = UIAlertController(title: "Menu upload", message: "Please choose a photo for the menu", preferredStyle: .actionSheet)
        
        let pickCamera = UIAlertAction(title: "Camera", style: .default) { (action) in
            
            let cameraPhotoPicker = self.imagePicker(sourceType: .camera)
            self.present(cameraPhotoPicker, animated: true) {
                print("Picked camera as photo source")
            }
        }
        
        let pickLibrary = UIAlertAction(title: "Photo Library", style: .default) { (action) in
            
            let libraryPhotoPicker = self.imagePicker(sourceType: .photoLibrary)
            self.present(libraryPhotoPicker, animated: true){
                print("Picked photo library as photo source")
            }
        }
        
        let pickNoMenu = UIAlertAction(title: "I don't have a menu", style: .default) { (action) in
            self.navigateToOrderVC()
        }
        
        let cancelPhotoSelection = UIAlertAction(title: "cancel", style: .cancel)
        
        pickPhotoAlertVC.addAction(pickCamera)
        pickPhotoAlertVC.addAction(pickLibrary)
        pickPhotoAlertVC.addAction(pickNoMenu)
        pickPhotoAlertVC.addAction(cancelPhotoSelection)
        
        
        self.present(pickPhotoAlertVC, animated: true, completion: nil)
    }

    
    
    
    
}
