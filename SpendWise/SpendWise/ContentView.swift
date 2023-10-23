//
//  ContentView.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-09-30.
//

import SwiftUI

struct ContentView: View {
    
    @State var expenseViewModel: ExpenseViewModel
    @State var categoryViewModel: CategoryViewModel
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: AddExpense(expenseViewModel: expenseViewModel, categoryViewModel: categoryViewModel)) {
                    Text("Add Expense")
                }
                NavigationLink(destination: AddCategory(viewModel: categoryViewModel)) {
                    Text("Add Category")
                }
                NavigationLink(destination: ExpenseDetails(expenses:  ExpenseStore.testExpenseStore.expenses[1])) {
                    Text("Expenses Details")
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView(expenseViewModel: ExpenseViewModel(store: ExpenseStore.testExpenseStore),
                categoryViewModel: CategoryViewModel(store: CategoryStore.testCategoryStore))
}
