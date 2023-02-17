//
//  ExpensesModel.swift
//  Cost-Accounting-Application
//
//  Created by Aleksandr.Grachev on 11.02.2023.
//

import Foundation

struct ExpensesModel: Codable {
    var name = ""
    var amount = 0.0
    var date = Date()
}
