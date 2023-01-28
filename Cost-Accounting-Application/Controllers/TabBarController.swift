//
//  TabBarController.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 28.01.2023.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTubs()
    }
    
    private func configureTubs() {
        let homeVC = HomeViewController()
        let scheduleVC = ExpenseScheduleViewController()
        let paymentVC = PaymentScheduleViewController()
        
        homeVC.navigationItem.largeTitleDisplayMode = .automatic
        scheduleVC.navigationItem.largeTitleDisplayMode = .automatic
        paymentVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        let scheduleNav = UINavigationController(rootViewController: scheduleVC)
        let paymentNav = UINavigationController(rootViewController: paymentVC)
        
        homeNav.navigationBar.prefersLargeTitles = true
        scheduleNav.navigationBar.prefersLargeTitles = true
        paymentNav.navigationBar.prefersLargeTitles = true
        
        homeNav.tabBarItem = UITabBarItem(title: "Расходы",
                                           image: UIImage(systemName: "house"),
                                           tag: 0)
        scheduleNav.tabBarItem = UITabBarItem(title: "График",
                                             image: UIImage(systemName: "function"),
                                             tag: 0)
        paymentNav.tabBarItem = UITabBarItem(title: "График платежей",
                                            image: UIImage(systemName: "wallet.pass"),
                                            tag: 0)
        
        setViewControllers([homeNav, scheduleNav, paymentNav],
                           animated: true)
        
        tabBar.addTopBorder(with: .lightGray, height: 0.5)
    }
}
