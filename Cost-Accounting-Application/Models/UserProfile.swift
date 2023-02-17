//
//  UserProfile.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 11.02.2023.
//

import Foundation

struct UserProfile: Codable {
    var moneyAmount = 0.0
    var expensesAmount = 0.0
    var incomeAmount = 0.0
    var incomes: [IncomeModel] = []
    var expensesCategories: [ExpensesCategoryModel] = []
    var payments: [PaymentModel] = []
}
