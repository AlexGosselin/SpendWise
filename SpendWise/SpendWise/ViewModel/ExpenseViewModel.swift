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
    
    var expenses: [Expense] { return store.expenses }
    
    init(store: ExpenseStore) {
        self.store = store
    }
    
    func addExpense(expense: Expense) {
        store.expenses.append(expense)
    }
}
