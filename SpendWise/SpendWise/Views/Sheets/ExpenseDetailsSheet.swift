//
//  ExpenseDetails.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-10-23.
//

import SwiftUI
import SwiftUIFontIcon

struct ExpenseDetailsSheet: View {
    @EnvironmentObject var themeManager: ThemeManagers
    
   @Binding var isShowDetails: Bool
    @Binding var isNavigateToEdit: Bool
    let expenses: Expense
    
    var body: some View {
        
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
                                                .foregroundColor(themeManager.selectedtheme.primaryColor)
                        })
                        
                    }
               
            
                    Spacer()
                Image(systemName: expenses.category!.iconName)
                        .font(.system(size: 60))
                        .padding(.bottom, 30)
                        .foregroundColor(expenses.categoryItem.colour)
                
                    
                    Spacer()
                    
                    Text("Expenses Details")
                        .font(.title)
                    
                    Divider()
                    
                    DetailRows(title: "Title", text: "\(expenses.title)")
                    DetailRows(title: "Amount", text: "$ \(expenses.amount)")
                    DetailRows(title: "Transaction Type", text: "\(expenses.transactionType)")
                    DetailRows(title: "Date & Time", text: "\(expenses.dateString)")
                    DetailRows(title: "Category", text: expenses.category?.name ?? "-")
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
                .frame(maxWidth: 145, alignment: .leading)
            
            Text(text)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        }
        .padding(.bottom, 5)
    }
}
