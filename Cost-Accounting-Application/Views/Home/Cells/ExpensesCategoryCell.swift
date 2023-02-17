//
//  ExpensesCategoryCell.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 28.01.2023.
//

import UIKit
import SnapKit

final class ExpensesCategoryCell: UITableViewCell {
    // MARK: - Identifier
    
    static let identifier = "ExpensesCategoryCell"
    
    // MARK: - SubViews
    
    private let iconView = UIImageView()
    private let expensesLabel = UILabel()
    private let categoryNameLabel = UILabel()
    
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
        configureCategoryNameLabel()
        configureIcon()
        configureExpensesLabel()
    }
    
    private func configureCategoryNameLabel() {
        categoryNameLabel.textColor = .label
        categoryNameLabel.font = .systemFont(ofSize: 20, weight: .regular)
        categoryNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(categoryNameLabel)
        
        categoryNameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
        }
    }
    
    private func configureIcon() {
        iconView.image = UIImage(systemName: "chevron.compact.right")
        iconView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(iconView)
        
        iconView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().offset(-16)
            $0.height.width.equalTo(24)
        }
    }
    
    private func configureExpensesLabel() {
        expensesLabel.text = "0₽"
        expensesLabel.textColor = .label
        expensesLabel.font = .systemFont(ofSize: 22, weight: .regular)
        expensesLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(expensesLabel)
        
        expensesLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(iconView.snp.left).offset(-16)
        }
    }
    
    // MARK: - Public
    
    public func configure(name: String, amount: Double) {
        categoryNameLabel.text = name
        expensesLabel.text = String(amount) + "₽"
    }
}
