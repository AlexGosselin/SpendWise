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
    @StateObject private var taxCalculatorModel = TaxCalculatorViewModel()
    @StateObject private var userModel = UserViewModel()
//    @StateObject private var ThemeManagers = ThemeManagers()
    @State private var categoryListVM = CategoryViewModel(store: CategoryStore())

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Category.self, Expense.self])
                .environmentObject(AppModel())
                .environmentObject(expenseListVM)
                .environment(categoryListVM)
                .environmentObject(taxCalculatorModel)
                .environmentObject(userModel)
                .environmentObject(ThemeManagers())
        }
    }
}
