//
//  ReportView.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-11-28.
//

import SwiftUI

struct ReportView: View {
    
    @State var expenses: [Expense]
    
    var body: some View {
        ReportSummaryView()
        Text("Report View")
    }
}

#Preview {
    ReportView(expenses: ExpenseStore.testData)
}
