//
//  ExpenseCategoriesViewController.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 28.01.2023.
//

import UIKit
import SnapKit

final class ExpenseCategoriesViewController: UIViewController {
    
    private var expenses: [String] = []
    
    // MARK: - SubViews
    
    private lazy var addExpenseButton = UIButton()
    private lazy var tableView = UITableView(frame: .zero)
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    // MARK: - layout
    
    private func configureViews() {
        view.backgroundColor = .systemBackground
        
        configureTableView()
        configureAddExpenseButton()
    }
    
    private func configureTableView() {
        tableView.separatorStyle = .singleLine
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 76, right: 0)
        tableView.register(ExpenseIncomeCell.self, forCellReuseIdentifier: ExpenseIncomeCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func configureAddExpenseButton() {
        addExpenseButton.backgroundColor = .systemBlue
        addExpenseButton.layer.cornerRadius = 12
        addExpenseButton.addTarget(self, action: #selector(addExpenseAction), for: .touchUpInside)
        addExpenseButton.setTitle("Добавить расходы", for: .normal)
        addExpenseButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addExpenseButton)
        
        addExpenseButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            $0.left.equalToSuperview().offset(16)
            $0.right.equalToSuperview().offset(-16)
            $0.height.equalTo(44)
        }
    }
    
}

// MARK: - UITableViewDataSource

extension ExpenseCategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExpenseIncomeCell.identifier, for: indexPath) as! ExpenseIncomeCell
        cell.configure(name: expenses[indexPath.row], expenses: "0")
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ExpenseCategoriesViewController: UITableViewDelegate {
    
}

// MARK: - Buttons Actions

private extension ExpenseCategoriesViewController {
    @objc
    func addExpenseAction() {
        let vc = AddNameCountViewController()
        vc.delegate = self
        vc.buttonTitle = "Добавть расход"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ExpenseCategoriesViewController: AddNameCountDelegate {
    func returnNameCount(name: String, count: Double) {
        expenses.append(name + " " + String(count))
        tableView.reloadData()
    }
}
