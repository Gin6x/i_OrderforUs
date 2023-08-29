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
        navigateToOrderVC()
    }

    func navigateToOrderVC() {

        let tabBarVC = UITabBarController()
        let orderVC = OrderViewController()
        let historyVC = HistoryViewController()
        let orderNavController = UINavigationController(rootViewController: orderVC)
        let historyNavcontroller = UINavigationController(rootViewController: historyVC)
        historyNavcontroller.delegate = orderNavController as? any UINavigationControllerDelegate
        orderNavController.navigationBar.prefersLargeTitles = true
        historyNavcontroller.navigationBar.prefersLargeTitles = true
        tabBarVC.viewControllers = [orderNavController, historyNavcontroller]
        orderVC.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "house"), tag: 0)
        historyVC.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "list.clipboard"), tag: 1)
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
    }
}
