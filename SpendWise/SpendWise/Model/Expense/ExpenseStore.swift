//
//  ExpenseStore.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import Observation

@Observable
final class ExpenseStore {
    var expenses: [Expense]
    
    init(expenses: [Expense]) {
        self.expenses = expenses
    }
}

extension ExpenseStore {
    static var testData = [
        Expense(id: 10, title: "rent payment", amount: 1500.0, categoryId: 401, category: CategoryStore.testData[2].name, desc: "Visa Desjardins", date: "01/24/2022", interval: "yearly", type: "debit", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: true, isExpense: true),
        Expense(id: 11, title: "car payment", amount: 178.94, categoryId: 401, category: CategoryStore.testData[3].name, desc: "Visa Desjardins", date: "01/24/2022", interval: "None", type: "credit", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: true, isExpense: true),
        Expense(id: 12, title: "groceries", amount: 54.12, categoryId: 401, category: CategoryStore.testData[1].name, desc: "Visa Desjardins", date: "01/24/2022", interval: "None", type: "debit", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: true, isExpense: true)
    ]
    
    static var testExpenseStore: ExpenseStore = ExpenseStore(expenses: testData)
}
