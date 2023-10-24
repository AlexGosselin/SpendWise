//
//  RecentExpenseList.swift
//  SpendWise
//
//  Created by ayomide olopha on 24/10/2023.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var expenseListVM: ExpenseViewModel
    
    var body: some View {
        VStack {
            HStack {
                // MARK: Header Title
                Text("Recent Transactions")
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
                    .foregroundColor(Color.text)
                }
            }
            .padding(.top)
            
            // MARK: Recent Transaction List
            ForEach(Array(expenseListVM.expenses.prefix(5).enumerated()), id: \.offset) { index, transaction in
                NavigationLink {
                    // MARK: Femi this is where you come in
//                    TransactionView(transaction: transaction)
                } label: {
                    // MARK: Femi this is where you come in
//                    TransactionRow(transaction: transaction)
                }
                
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    static let transactionListVM: ExpenseViewModel = {
        let expenseListVM = ExpenseViewModel(store: <#ExpenseStore#>)
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
