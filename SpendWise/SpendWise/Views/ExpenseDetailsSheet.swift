//
//  ExpenseDetails.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-10-23.
//

import SwiftUI

struct ExpenseDetailsSheet: View {
    @State var isShowDetails: Bool = false
    let expenses: Expense
    
    var body: some View {
        Text("Show Details")
            .font(.title)
            
        
        Button(action: {
            isShowDetails = true
        }, label: {
            Text("Show details")
        })
        .buttonStyle(.borderedProminent)
        .padding()
        
        .sheet(isPresented: $isShowDetails, content: {
            VStack {
                Spacer()
//                Image(systemName: expenses.categoryItem.icon)
//                    .font(.system(size: 60))
//                    .padding(.bottom, 30)
//                    .foregroundColor(expenses.categoryItem.colour)
                
                
//                Spacer()
                
                Text("Expenses Details")
                    .font(.title)
                
                Divider()
                
                DetailRows(title: "Amount", text: "$ \(expenses.amount)")
                DetailRows(title: "Date & Time", text: "\(expenses.dateParsed)")
                DetailRows(title: "Category", text: expenses.categoryItem.name)
                DetailRows(title: "Description", text: "\(expenses.desc ?? "-")")
                
                Spacer()
                
                Button(action: {
                    isShowDetails = false
                }, label: {
                    Text("Close")
                })
                .foregroundColor(expenses.categoryItem.colour)
                .padding()
                
                Spacer()
            }
            .foregroundStyle(.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .presentationDetents([ .fraction(0.6), .fraction(0.75)])
            .presentationDragIndicator(.visible)
            .padding()
            
        })
    }
}

#Preview {
    ExpenseDetailsSheet(expenses: ExpenseStore.testExpenseStore.expenses[2])
}

struct DetailRows: View {
    var title: String
    var text: String
    
    var body: some View {
        HStack {
            Text("\(title):")
                .foregroundStyle(.gray)
                .frame(maxWidth: 120, alignment: .leading)
            
            Text(text)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
        .padding(.bottom, 5)
    }
}
