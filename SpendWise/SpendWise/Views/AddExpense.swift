//
//  AddExpense.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-16.
//

import SwiftUI

struct AddExpense: View {
    
    @State var expenseViewModel: ExpenseViewModel
    @State var categoryViewModel: CategoryViewModel
    
    @State var title = ""
    @State var amount: String = ""
    @State var date = Date()
    @State var description = ""
    @State var category: Category?
        
    
    var currencyFormatter = NumberFormatter()
    
    var body: some View {
        Text("Add Expense")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .padding()
        
        VStack {
            HStack {
                Text("Title")
                Spacer()
                TextField("My Expense", text: $title)
                    .multilineTextAlignment(.trailing)
            }
            .padding()

            HStack {
                Text("Amount")
                Spacer()
                TextField("Amount", text: $amount)
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.trailing)
            }
            .padding()
            
            HStack {
                Text("Category")
                Spacer()
                Picker("Category", selection: $category) {
                    
                    Text("None").tag(Category?.none)
                    
                    ForEach(categoryViewModel.categories) { cat in
                        HStack {
                            Text(cat.name)
                            cat.icon
                        }.tag(Category?.some(cat))
                        
                    }

                }
                .pickerStyle(.menu)
                .cornerRadius(10.0)
                .background(RoundedRectangle(cornerRadius: 10.0).fill(.quinary))
            }
            .padding()
            

            DatePicker("Date", selection: $date, displayedComponents: [.date])
                .padding()
            
            VStack(alignment: .leading) {
                Text("Description")
                TextEditor(text: $description)
                    .cornerRadius(10.0)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.quaternary, lineWidth: 2))
            }
            .padding()
            
            Button("Save") {
                guard let doubleAmount = Double(amount) else {
                    print("could not convert amount to double")
                    return
                }
                
                guard let unwrappedCategory = category else {
                    print("category is null")
                    return
                }
                
                let newExpense = Expense(title: title, amount: doubleAmount, category: unwrappedCategory, desc: description, date: date)
                
                expenseViewModel.addExpense(expense: newExpense)
                print(expenseViewModel.expenses.count)
//                description = String(expenseViewModel.expenses.count)
            }
        }
        .padding()

    }
}

#Preview {
    AddExpense(expenseViewModel: ExpenseViewModel(store: ExpenseStore.testExpenseStore),
               categoryViewModel: CategoryViewModel(store: CategoryStore.testCategoryStore))
}
