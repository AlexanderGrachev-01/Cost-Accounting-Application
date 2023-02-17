//
//  UserManager.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 11.02.2023.
//

import Foundation

class UserManager {
    // MARK: - Keys

    enum Keys: String, CaseIterable {
        case user = "app.profile.user"
    }
    
    // MARK: - Singleton

    public static let shared = UserManager()
    
    // MARK: - Properties
    
    var profile = UserProfile()
    
    // MARK: - Init

    private init() {
        profile = {
            if let profileString = UserDefaults.standard.value(
                forKey: Keys.user.rawValue
            ) as? String {
                return try! JSONDecoder().decode(
                    UserProfile.self,
                    from: profileString.data(using: .utf8) ?? Data()
                )
            }
            return UserProfile()
        }()
    }
    
    private func update(newValue: UserProfile) {
        let profileJson = try? JSONEncoder().encode(newValue)
        let profileString = String(data: profileJson ?? Data(), encoding: .utf8)
        UserDefaults.standard.set(profileString, forKey: Keys.user.rawValue)
    }


    // MARK: Functions
    
    func clear() {
        profile = UserProfile()
        update(newValue: profile)
    }
    
    func addIncome(name: String, amount: Double) {
        let income = IncomeModel(name: name, amount: amount, date: Date())
        profile.incomes.append(income)
        profile.incomeAmount += amount
        profile.moneyAmount += amount
        update(newValue: profile)
    }
    
    func deleteIncome(index: Int) {
        profile.incomes.remove(at: index)
        update(newValue: profile)
    }
    
    func addExpensesCategory(name: String) {
        let category = ExpensesCategoryModel(name: name)
        profile.expensesCategories.append(category)
        update(newValue: profile)
    }
    
    func deleteExpensesCategory(index: Int) {
        profile.expensesCategories.remove(at: index)
        update(newValue: profile)
    }
    
    func addExpenses(categoryIndex: Int, name: String, amount: Double) {
        let expenses = ExpensesModel(name: name, amount: amount, date: Date())
        profile.expensesCategories[categoryIndex].expenses.append(expenses)
        profile.moneyAmount -= amount
        profile.expensesAmount += amount
        profile.expensesCategories[categoryIndex].amount += amount
        update(newValue: profile)
    }
    
    func deleteExpenses(categoryIndex: Int, expensesIndex: Int) {
        profile.expensesCategories[categoryIndex].expenses.remove(at: expensesIndex)
        update(newValue: profile)
    }
    
    // добавление и удаление платежей
}
