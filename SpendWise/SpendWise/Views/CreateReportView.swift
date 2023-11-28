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
    @State private var filteredExpenses: [Expense]?
    
    var body: some View {
        NavigationStack {
            DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                .padding(.bottom)
            DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                .padding(.bottom)
            
            Button("Generate Report") {
                
                filteredExpenses = expenseViewModel.getExpenses(startDate: startDate, endDate: endDate)
                
                if let filterExpenses = filteredExpenses {
                    if(filterExpenses.count > 0) {
                        showReport.toggle()
                    } else {
                        showNoResultsAlert.toggle()
                    }
                } else {
                    showInvalidDatesAlert.toggle()
                }
                
            }
            .padding()
        }
        .padding()
        .navigationTitle("Generate Report")
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
            ReportView(expenses: filteredExpenses!)
        })
    }
        
}

#Preview {
    CreateReportView()
}
