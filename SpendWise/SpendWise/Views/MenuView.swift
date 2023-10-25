//
//  MenuView.swift
//  SpendWise
//
//  Created by ayomide olopha on 24/10/2023.
//

import SwiftUI

struct MenuView: View {
    
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
                NavigationLink(destination: ExpenseDetailsSheet(expenses:  ExpenseStore.testExpenseStore.expenses[1])) {
                    Text("Expenses Details")
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    MenuView(expenseViewModel: ExpenseViewModel(store: ExpenseStore.testExpenseStore),
                categoryViewModel: CategoryViewModel(store: CategoryStore.testCategoryStore))
}
