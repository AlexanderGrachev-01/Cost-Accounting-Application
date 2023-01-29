//
//  ExpenseIncomeCell.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 29.01.2023.
//

import UIKit
import SnapKit

final class ExpenseIncomeCell: UITableViewCell {
    // MARK: - Identifier
    
    static let identifier = "ExpenseIncomeCell"
    
    // MARK: - SubViews
    
    private let nameLabel = UILabel()
    private let expenseIncomeLabel = UILabel()
    
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
        configureNameLabel()
        configureExpenseIncomeLabel()
    }
    
    private func configureNameLabel() {
        nameLabel.textColor = .label
        nameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }
    }
    
    private func configureExpenseIncomeLabel() {
        expenseIncomeLabel.text = "0₽"
        expenseIncomeLabel.textColor = .label
        expenseIncomeLabel.font = .systemFont(ofSize: 18, weight: .regular)
        expenseIncomeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(expenseIncomeLabel)
        
        expenseIncomeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-16)
        }
    }
    
    // MARK: - Public
    
    public func configure(name: String, expenses: String) {
        nameLabel.text = name
        expenseIncomeLabel.text = "-" + expenses + "₽"
    }
}
