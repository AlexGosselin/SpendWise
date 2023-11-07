//
//  Home.swift
//  SpendWise
//
//  Created by ayomide olopha on 05/11/2023.
//

import SwiftUI
import SwiftUICharts
import SwiftUIFontIcon

struct HomeView: View {
    
//    @State var expenseViewModel: ExpenseViewModel
//    @State var categoryViewModel: CategoryViewModel
    @EnvironmentObject var expenseListVM: ExpenseViewModel

    
    var body: some View {
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
                        .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon2.opacity(0.4), Color.icon)))
                        .frame(height: 300)
                    }
                    
                    // MARK: Transaction List
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.background2)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape.fill")
                            .tint(Color.icon)
                    }
                }
                
                // MARK: Notification Icon
                ToolbarItem {
                    NavigationLink(destination: MenuView()) {
                        FontIcon.text(.awesome5Solid(code: .plus), fontsize: 24, color: Color.icon)
                    }
                    
                    // MARK: ADD this later
                    //                ToolbarItem {
                    //                    Image(systemName: "bell.badge")
                    //                        .symbolRenderingMode(.palette)
                    //                        .foregroundStyle(Color.icon2, .primary)
                    //                }
                    
                }

            }
        }
    }
    
    
    struct HomeView_Previews: PreviewProvider {
        static let expenseListVM: ExpenseViewModel = {
            let expenseListVM = ExpenseViewModel(store: ExpenseStore.testExpenseStore)
            expenseListVM.transactions = expenseListPreviewData
            return expenseListVM
        }()
        
        static var previews: some View {
            Group {
                HomeView()
                    .preferredColorScheme(.dark)
            }
            .environmentObject(expenseListVM)
        }
    }
}

