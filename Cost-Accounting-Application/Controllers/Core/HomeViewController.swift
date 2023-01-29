//
//  HomeViewController.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 28.01.2023.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    private var categories: [String] = ["Дом", "Продукты", "Досуг", "Постоянные траты", "Путешествия"]
    
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
        tableView.separatorStyle = .singleLine
        tableView.register(GeneralInfoCell.self, forCellReuseIdentifier: GeneralInfoCell.identifier)
        tableView.register(ExpensesCategoryCell.self, forCellReuseIdentifier: ExpensesCategoryCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 76, right: 0)
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
        addExpenseCategoryButton.setTitle("Добавить категорию", for: .normal)
    }
    
    private func configureAddIncomeButton() {
        addIncomeButton.backgroundColor = .systemBlue
        addIncomeButton.layer.cornerRadius = 12
        addIncomeButton.addTarget(self, action: #selector(addIncomeAction), for: .touchUpInside)
        addIncomeButton.setTitle("Добавить доход", for: .normal)
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

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: GeneralInfoCell.identifier, for: indexPath) as! GeneralInfoCell
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: ExpensesCategoryCell.identifier, for: indexPath) as! ExpensesCategoryCell
            cell.configure(name: categories[indexPath.row - 1], expenses: "0")
            return cell
        }
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 92
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            return
        default:
            let vc = ExpenseCategoriesViewController()
            vc.title = categories[indexPath.row - 1]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: - Buttons Action

private extension HomeViewController {
    @objc
    func addExpenseCategoryAction() {
        let vc = AddNameViewController()
        vc.delegate = self
        vc.buttonTitle = "Добавить категорию расходов"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func addIncomeAction() {
        let vc = AddNameCountViewController()
        vc.delegate = self
        vc.buttonTitle = "Добавить доход"
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - AddNameDelegate

extension HomeViewController: AddNameDelegate {
    func returnName(name: String) {
        categories.append(name)
        tableView.reloadData()
    }
}

// MARK: - AddNameDelegate

extension HomeViewController: AddNameCountDelegate {
    func returnNameCount(name: String, count: Double) {
        categories.append(name + String(count))
        tableView.reloadData()
    }
}
