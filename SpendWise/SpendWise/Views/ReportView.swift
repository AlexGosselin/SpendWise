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
    @Binding var startDate: Date
    @Binding var endDate: Date
    
    
    var body: some View {
        ReportSummaryView(outgoing: $outgoing, incoming: $incoming)
        List {
            ForEach(filteredExpenses) { ex in
                ExpenseRow(expense: ex)
            }
        }
        ShareLink(item: "SpendWise Report for \(startDate.formatted(date: .long, time: .omitted)) to \(endDate.formatted(date: .long, time: .omitted))\n\nIncoming: \(incoming.formatted(.currency(code: "USD")))\nOutgoing: \(outgoing.formatted(.currency(code: "USD")))\nNet:\((incoming - outgoing).formatted(.currency(code: "USD")))", subject: Text("SpendWise Report for \(startDate.formatted(date: .numeric, time: .omitted)) to \(endDate.formatted(date: .numeric, time: .omitted))"), message: Text("\n\nTrack your expenses with SpendWise!"))
    }
}

//#Preview {
//    ReportView(expenses: ExpenseStore.testData)
//}
