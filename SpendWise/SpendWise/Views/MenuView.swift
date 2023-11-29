//
//  MenuView.swift
//  SpendWise
//
//  Created by ayomide olopha on 24/10/2023.
//

import SwiftUI

struct MenuView: View {
    
//    @State var expenseViewModel: ExpenseViewModel
//    @State var categoryViewModel: CategoryViewModel
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: AddExpense()) {
                    Text("Add Expense")
                }
                NavigationLink(destination: AddCategory()) {
                    Text("Add Category")
                }
                NavigationLink(destination: ListCategory()) {
                    Text("Category List")
                }
                NavigationLink(destination: CreateReportView()) {
                    Text("Create Report")
                }
            }
            .navigationTitle("Manage Expense")
        }
    }
}

#Preview {
    MenuView()
}
