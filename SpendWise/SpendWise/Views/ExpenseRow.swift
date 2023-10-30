//
//  ExpenseRow.swift
//  SpendWise
//
//  Created by ayomide olopha on 24/10/2023.
//

import SwiftUI
import SwiftUIFontIcon

struct ExpenseRow: View {
    var expense: Expense
    @State private var isShowDetails: Bool = false
    
    var body: some View {
        HStack(spacing: 20) {
            // MARK: Transaction Category Icon
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.icon.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay {
                    FontIcon.text(.awesome5Solid(code: .icons), fontsize: 24, color: Color.icon)
                }
            
            VStack(alignment: .leading, spacing: 6) {
                // MARK: Transaction Merchant
                Text(expense.merchant)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                
                // MARK: Transaction Category
                Text(expense.categoryName)
                    .font(.footnote)
                    .opacity(0.7)
                    .lineLimit(1)
                
                // MARK: Transaction Date
                Text(expense.dateParsed, format: .dateTime.year().month().day())
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            // MARK: Transaction Amount
            Text(expense.amount, format: .currency(code: "CAD"))
                .bold()
                .foregroundColor(expense.type == TransactionType.credit.rawValue ? Color.text : .primary)
        }
        .padding([.top, .bottom], 8)
        .background(Rectangle().fill(Color(UIColor.systemBackground)))
        .onTapGesture {
            isShowDetails.toggle()
        }
        .sheet(isPresented: $isShowDetails, content: {
            ExpenseDetailsSheet(isShowDetails: $isShowDetails, expenses: expense)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .presentationDetents([ .fraction(0.6), .fraction(0.75)])
                .presentationDragIndicator(.visible)
                .padding()
        })
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExpenseRow(expense: transactionPreviewData)
            ExpenseRow(expense: transactionPreviewData)
                .preferredColorScheme(.dark)
        }
    }
}
