//
//  HomeViewController.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 28.01.2023.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    // MARK: - SubViews
    
    private lazy var addExpenseCategoryButton = UIButton()
    private lazy var addIncomeButton = UIButton()
    private lazy var buttonStackView = UIStackView(arrangedSubviews: [addExpenseCategoryButton, addIncomeButton])
    private lazy var tableView = UITableView(frame: .zero)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    // MARK: - layout
    
    private func configureViews() {
        view.backgroundColor = .systemBackground
        title = "Расходы"
        
        configureTableView()
        configureAddExpenseCategoryButton()
        configureAddIncomeButton()
        configureButtonStackView()
    }
    
    private func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func configureAddExpenseCategoryButton() {
        addExpenseCategoryButton.backgroundColor = .systemBlue
        addExpenseCategoryButton.layer.cornerRadius = 12
        addExpenseCategoryButton.addTarget(self, action: #selector(addExpenseCategoryAction), for: .touchUpInside)
        addExpenseCategoryButton.setTitle("Add category", for: .normal)
    }
    
    private func configureAddIncomeButton() {
        addIncomeButton.backgroundColor = .systemBlue
        addIncomeButton.layer.cornerRadius = 12
        addIncomeButton.addTarget(self, action: #selector(addIncomeAction), for: .touchUpInside)
        addIncomeButton.setTitle("Add income", for: .normal)
    }
    
    private func configureButtonStackView() {
        buttonStackView.spacing = 16
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)
        
        buttonStackView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(44)
        }
    }
}

// MARK: - Buttons Action

private extension HomeViewController {
    @objc
    func addExpenseCategoryAction() {
        
    }
    
    @objc
    func addIncomeAction() {
        
    }
}
