//
//  HomeViewController.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 28.01.2023.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    // MARK: - layout
    
    private func configureViews() {
        view.backgroundColor = .systemBackground
        title = "Расходы"
    }
}
