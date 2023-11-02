//
//  SpendWiseApp.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-09-30.
//

import SwiftUI

@main
struct SpendWiseApp: App {
    @StateObject var expenseListVM = ExpenseViewModel(store: ExpenseStore.testExpenseStore)
    

    @State private var categoryListVM = CategoryViewModel(store: CategoryStore())

//    var expenseViewModel: ExpenseViewModel = ExpenseViewModel(store: ExpenseStore.testExpenseStore)
//    var categoryViewModel: CategoryViewModel = CategoryViewModel(store: CategoryStore.testCategoryStore)
//    
    var body: some Scene {
        WindowGroup {
            ContentView(expenseViewModel: ExpenseViewModel(store: ExpenseStore.testExpenseStore), categoryViewModel: CategoryViewModel(store: CategoryStore.testCategoryStore))
                .environmentObject(expenseListVM)
                .environment(categoryListVM)
//                .environment(expenseVM)
        }
    }
}
