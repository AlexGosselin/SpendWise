//
//  SpendWiseApp.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-09-30.
//

import SwiftUI

@main
struct SpendWiseApp: App {
    
    var expenseViewModel: ExpenseViewModel = ExpenseViewModel(store: ExpenseStore.testExpenseStore)
    var categoryViewModel: CategoryViewModel = CategoryViewModel(store: CategoryStore.testCategoryStore)
    
    var body: some Scene {
        WindowGroup {
            ContentView(expenseViewModel: expenseViewModel, categoryViewModel: categoryViewModel)
        }
    }
}
