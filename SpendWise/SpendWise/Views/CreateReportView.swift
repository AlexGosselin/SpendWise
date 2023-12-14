//
//  CreateReportView.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-11-27.
//

import SwiftUI

struct CreateReportView: View {
    
    @EnvironmentObject var expenseViewModel: ExpenseViewModel

    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var showInvalidDatesAlert = false
    @State private var showNoResultsAlert = false
    @State private var showReport = false
    @State private var filteredExpenses: [Expense] = []
    @State private var outgoing = 0.0
    @State private var incoming = 0.0
    
    var body: some View {
        NavigationStack {
            DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                .padding(.bottom)
            DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                .padding(.bottom)
            
            PlainButton(buttonName: "Generate Report", action: {
                outgoing = 0.0
                incoming = 0.0
                
                if let expenses = expenseViewModel.getExpenses(startDate: startDate, endDate: endDate) {
                    filteredExpenses = expenses
                    print("count = \(filteredExpenses.count)")
                    if(filteredExpenses.count > 0) {
                        expenses.forEach({ ex in
                            if(ex.isExpense) {
                                outgoing += ex.amount
                            } else {
                                incoming += ex.amount
                            }
                        })
                        
                        showReport.toggle()
                    } else {
                        showNoResultsAlert.toggle()
                    }
                } else {
                    showInvalidDatesAlert.toggle()
                }
                
            })
            
        }
        .padding()
        .navigationTitle("Create Report")
        .alert("Start date cannot be after end date.", isPresented: $showInvalidDatesAlert) {
            Button("OK", role: .cancel) {
                showInvalidDatesAlert.toggle()
            }
        }
        .alert("No results found in this date range.", isPresented: $showNoResultsAlert) {
            Button("OK", role: .cancel) {
                showNoResultsAlert.toggle()
            }
        }
        .sheet(isPresented: $showReport, content: {
            ReportView(filteredExpenses: $filteredExpenses, incoming: $incoming, outgoing: $outgoing, startDate: $startDate, endDate: $endDate)
        })
    }
        
}

#Preview {
    CreateReportView()
}
