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
    let formatter = DateFormatter()
    
    init() {
        formatter.dateFormat = "MM/dd/yyyy"
        var index = 0
        while index < ExpenseStore.testData.count {
            
            ExpenseStore.testData[index].date = formatter.date(from: ExpenseStore.testData[index].dateString)!
            
            index += 1
        }
        
        expenses = ExpenseStore.testData

    }
    
    init(expenses: [Expense]) {
        self.expenses = expenses
        
        formatter.dateFormat = "MM/dd/yyyy"
        var index = 0
        while index < self.expenses.count {
            
            self.expenses[index].date = formatter.date(from: self.expenses[index].dateString)!
            
            index += 1
        }
    }
}

extension ExpenseStore {
    static var testData = [
        Expense(id: 10, title: "rent payment", amount: 1500.0, categoryId: 401, categoryName: CategoryStore.testData[2].name, category: CategoryStore.testData[2], desc: "Visa Desjardins", dateString: "01/24/2022", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: false, isExpense: true),
        Expense(id: 11, title: "car payment", amount: 178.94, categoryId: 401, categoryName: CategoryStore.testData[3].name, category: CategoryStore.testData[3], desc: "Visa Desjardins", dateString: "01/24/2023", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: false, isExpense: true),
        Expense(id: 12, title: "groceries", amount: 54.12, categoryId: 401, categoryName: CategoryStore.testData[1].name, category: CategoryStore.testData[1], desc: "Visa Desjardins", dateString: "01/24/2022", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: false, isExpense: true),
        Expense(id: 13, title: "groceries", amount: 54.12, categoryId: 401, categoryName: CategoryStore.testData[1].name, category: CategoryStore.testData[1], desc: "Visa Desjardins", dateString: "05/24/2022", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: false, isExpense: true),
        Expense(id: 14, title: "groceries", amount: 54.12, categoryId: 401, categoryName: CategoryStore.testData[1].name, category: CategoryStore.testData[1], desc: "Visa Desjardins", dateString: "01/24/2023", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: false, isExpense: true),
        Expense(id: 15, title: "groceries", amount: 54.12, categoryId: 401, categoryName: CategoryStore.testData[1].name, category: CategoryStore.testData[1], desc: "Visa Desjardins", dateString: "11/20/2023", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: false, isExpense: true),
        Expense(id: 16, title: "car payment", amount: 178.94, categoryId: 401, categoryName: CategoryStore.testData[3].name, category: CategoryStore.testData[3], desc: "Visa Desjardins", dateString: "11/05/2023", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: false, isExpense: true),
        Expense(id: 17, title: "Sold furniture", amount: 120.00, categoryId: 401, categoryName: CategoryStore.testData[3].name, category: CategoryStore.testData[3], desc: "Visa Desjardins", dateString: "11/05/2023", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: true, isExpense: false),
        Expense(id: 18, title: "Paycheck", amount: 1567.93, categoryId: 401, categoryName: CategoryStore.testData[3].name, category: CategoryStore.testData[3], desc: "Visa Desjardins", dateString: "09/05/2023", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: true, isExpense: false),
        Expense(id: 19, title: "Gift", amount: 20, categoryId: 401, categoryName: CategoryStore.testData[3].name, category: CategoryStore.testData[3], desc: "Visa Desjardins", dateString: "11/05/2023", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: true, isExpense: false),
    ]
    
    static var testExpenseStore: ExpenseStore = ExpenseStore(expenses: testData)
}
