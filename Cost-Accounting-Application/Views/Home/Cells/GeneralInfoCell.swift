//
//  GeneralInfoCell.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 28.01.2023.
//

import UIKit
import SnapKit

final class GeneralInfoCell: UITableViewCell {
    // MARK: - Identifier
    
    static let identifier = "GeneralInfoCell"
    
    // MARK: - SubViews
    
    private let balanceLabel = UILabel()
    private let expensesLabel = UILabel()
    private let incomeLabel = UILabel()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func configureViews() {
        configureBalanceLabel()
        configureExpensesLabel()
        configureIncomeLabel()
    }
    
    private func configureBalanceLabel() {
        balanceLabel.textColor = .label
        balanceLabel.font = .systemFont(ofSize: 24, weight: .semibold)
        balanceLabel.text = "Баланс: 0₽"
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(balanceLabel)
        
        balanceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalToSuperview().offset(16)
        }
    }
    
    private func configureExpensesLabel() {
        expensesLabel.textColor = .secondaryLabel
        expensesLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        expensesLabel.text = "Расходы: 0₽"
        expensesLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(expensesLabel)
        
        expensesLabel.snp.makeConstraints {
            $0.top.equalTo(balanceLabel.snp.bottom).offset(8)
            $0.left.equalToSuperview().offset(16)
        }
    }
    
    private func configureIncomeLabel() {
        incomeLabel.textColor = .secondaryLabel
        incomeLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        incomeLabel.text = "Доходы: 0₽"
        incomeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(incomeLabel)
        
        incomeLabel.snp.makeConstraints {
            $0.top.equalTo(balanceLabel.snp.bottom).offset(8)
            $0.left.equalTo(self.snp.centerX).offset(16)
        }
    }
    
    // MARK: - Public
    
    public func configure(balance: Double, expenses: Double, income: Double) {
        balanceLabel.text = "Баланс: \(balance)₽"
        expensesLabel.text = "Расходы:  \(expenses)₽"
        incomeLabel.text = "Доходы:  \(income)₽"
    }
}
