//
//  ContentView.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-09-30.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    
    @State var expenseViewModel: ExpenseViewModel
    @State var categoryViewModel: CategoryViewModel
    @EnvironmentObject var expenseListVM: ExpenseViewModel
    
    var body: some View {
        ///TODO: commenting this so as to put the homescreen here a tabbar navigation will be be created for the menus
//        NavigationStack {
//            List {
//                NavigationLink(destination: AddExpense(expenseViewModel: expenseViewModel, categoryViewModel: categoryViewModel)) {
//                    Text("Add Expense")
//                }
//                NavigationLink(destination: AddCategory(viewModel: categoryViewModel)) {
//                    Text("Add Category")
//                }
//            }
//            .navigationTitle("Home")
//        }
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // MARK: Title
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    
                    // MARK: Chart
                    let data = expenseListVM.accumulateTransactions()
                    
                    if !data.isEmpty {
                        let totalExpenses = data.last?.1 ?? 0
                        
                        CardView {
                            VStack(alignment: .leading) {
                                ChartLabel(totalExpenses.formatted(.currency(code: "CAD")), type: .title, format: "$%.02f")
                                
                                LineChart()
                            }
                            .background(Color.systemBackground)
                        }
                        .data(data)
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(0.4), Color.icon)))
                        .frame(height: 300)
                    }
                    
                    // MARK: Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // MARK: Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
    }
}

#Preview {
    ContentView(expenseViewModel: ExpenseViewModel(store: ExpenseStore.testExpenseStore),
                categoryViewModel: CategoryViewModel(store: CategoryStore.testCategoryStore))
    .preferredColorScheme(.dark)
}
