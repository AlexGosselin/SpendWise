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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AppModel())
                .environmentObject(expenseListVM)
                .environment(categoryListVM)
        }
    }
}
