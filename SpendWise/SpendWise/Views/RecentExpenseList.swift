//
//  RecentExpenseList.swift
//  SpendWise
//
//  Created by ayomide olopha on 24/10/2023.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var expenseListVM: ExpenseViewModel
    @EnvironmentObject var themeManager: ThemeManagers
    
    var body: some View {
        VStack {
            HStack {
                // MARK: Header Title
                Text("Recent Expense")
                    .bold()
                
                Spacer()
                
                // MARK: Header Link
                NavigationLink {
                    // MARK: This goes in the next sprint
                } label: {
                    HStack(spacing: 4) {
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(themeManager.selectedtheme.primaryColor)
                }
            }
            .padding(.top)
            
            // MARK: Recent Transaction List
            ForEach(Array(expenseListVM.store.expenses.enumerated().reversed()), id: \.offset) { index, expenses in
                    ExpenseRow(expense: expenses)
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: ExpenseViewModel = {
        let expenseListVM = ExpenseViewModel(store: ExpenseStore.testExpenseStore)
        expenseListVM.transactions = expenseListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                RecentTransactionList()
            }
            NavigationView {
                RecentTransactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}
