//
//  ExpenseViewModel.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import Observation

@Observable
final class ExpenseViewModel {
    var store: ExpenseStore
    static let repeatFrequencies = ["Never", "Daily", "Weekly", "Monthly", "Yearly"]
    
    var expenses: [Expense] { return store.expenses }
    
    init(store: ExpenseStore) {
        self.store = store
    }
    
    func addExpense(expense: Expense) {
        var newExpense = expense
        var repeatingExpense = expense
        var timer: Timer?
        
        switch expense.interval {
        case "Daily":
            timer = Timer.scheduledTimer(withTimeInterval: 86400, repeats: true) { timer in
                repeatingExpense.date = Date()
                repeatingExpense.setTimer(timer: timer)
                self.store.expenses.append(repeatingExpense)
            }
            break
        case "Weekly":
            timer = Timer.scheduledTimer(withTimeInterval: 604800, repeats: true) { timer in
                repeatingExpense.date = Date()
                repeatingExpense.setTimer(timer: timer)
                self.store.expenses.append(repeatingExpense)
            }
            break
        case "Monthly":
            timer = Timer.scheduledTimer(withTimeInterval: 2628288, repeats: true) { timer in
                repeatingExpense.date = Date()
                repeatingExpense.setTimer(timer: timer)
                self.store.expenses.append(repeatingExpense)
            }
            break
        case "Yearly":
            timer = Timer.scheduledTimer(withTimeInterval: 31536000, repeats: true) { timer in
                repeatingExpense.date = Date()
                repeatingExpense.setTimer(timer: timer)
                self.store.expenses.append(repeatingExpense)
            }
            break
        default: break
            
        }
        
        if let timer = timer {
            newExpense.setTimer(timer: timer)
        }
        store.expenses.append(newExpense)
    }
}
