//
//  Expense.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation

struct Expense: Identifiable {
    var id: UUID
    
    var title: String
    var amount: Double
    var category: Category
    var desc: String?
    var date: Date
    
    init(id: UUID = UUID(), title: String, amount: Double, category: Category, desc: String? = nil, date: Date = Date()) {
        self.id = id
        self.title = title
        self.amount = amount
        self.category = category
        self.desc = desc
        self.date = date
    }
    
}
