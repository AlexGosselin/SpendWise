//
//  ReportView.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-11-28.
//

import SwiftUI

struct ReportView: View {
    
    @Binding var filteredExpenses: [Expense]
    @Binding var incoming: Double
    @Binding var outgoing: Double
    
    
    var body: some View {
        ReportSummaryView(outgoing: $outgoing, incoming: $incoming)
        List {
            ForEach(filteredExpenses) { ex in
                ExpenseRow(expense: ex)
            }
        }
    }
}

//#Preview {
//    ReportView(expenses: ExpenseStore.testData)
//}
