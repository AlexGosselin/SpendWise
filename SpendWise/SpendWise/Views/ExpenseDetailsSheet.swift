//
//  ExpenseDetails.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-10-23.
//

import SwiftUI
import SwiftUIFontIcon

struct ExpenseDetailsSheet: View {
   @Binding var isShowDetails: Bool
    @Binding var isNavigateToEdit: Bool
    let expenses: Expense
    
    var body: some View {
        
        let imageCode: FontAwesomeCode = expenses.categoryItem.fontAwesomeIcon

        NavigationStack {
            VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            isShowDetails = false
                            isNavigateToEdit = true
                        }, label: {
                            Image(systemName: "pencil")
                                                .font(.system(size: 30))
                                                .foregroundColor(Color.icon)
                        })
                        
                    }
               
            
                    Spacer()
    //                Image(systemName: "\(expenses.categoryItem.name)")
    //                    .font(.system(size: 60))
    //                    .padding(.bottom, 30)
    //                    .foregroundColor(expenses.categoryItem.colour)
                    
                    FontIcon.text(.awesome5Solid(code: imageCode), fontsize: 60, color: Color.icon)
                    
                    Spacer()
                    
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
        }
            
    }
}

#Preview {
    ExpenseDetailsSheet(isShowDetails: .constant(false), isNavigateToEdit:.constant(false), expenses: ExpenseStore.testExpenseStore.expenses[2])
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
