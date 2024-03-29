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
        historyVC.delegate = orderVC
        let orderNavController = UINavigationController(rootViewController: orderVC)
        let historyNavController = UINavigationController(rootViewController: historyVC)
        orderNavController.navigationBar.prefersLargeTitles = true
        historyNavController.navigationBar.prefersLargeTitles = true
        tabBarVC.viewControllers = [orderNavController, historyNavController]
        orderVC.tabBarItem = UITabBarItem(title: "Order", image: UIImage(systemName: "house"), tag: 0)
        historyVC.tabBarItem = UITabBarItem(title: "History", image: UIImage(systemName: "list.clipboard"), tag: 1)
        orderNavController.tabBarItem = nil
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
    }
}
