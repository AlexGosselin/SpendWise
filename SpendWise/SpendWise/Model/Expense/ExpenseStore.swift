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
        Expense(title: "rent payment", amount: 1500.0, category: CategoryStore.testData[2], desc: "Visa Desjardins", date: "01/24/2022", interval: "yearly", type: "debit", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isExpense: true, isTransfer: true),
        Expense(title: "car payment", amount: 178.94, category: CategoryStore.testData[3], desc: "Visa Desjardins", date: "01/24/2022", interval: "None", type: "credit", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isExpense: true, isTransfer: true),
        Expense(title: "groceries", amount: 54.12, category: CategoryStore.testData[1], desc: "Visa Desjardins", date: "01/24/2022", interval: "None", type: "debit", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isExpense: true, isTransfer: true)
    ]
    
    static var testExpenseStore: ExpenseStore = ExpenseStore(expenses: testData)
}
