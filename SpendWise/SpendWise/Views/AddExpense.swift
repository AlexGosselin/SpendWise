//
//  AddExpense.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-16.
//

import SwiftUI

//var categories = ["cat1", "cat2", "fdhgshkasflgfdhsgfdsdfdfsafdh"]


struct AddExpense: View {
    
    @State var expenseViewModel: ExpenseViewModel
    @State var categoryViewModel: CategoryViewModel
    
    @State var title = ""
    @State var amount = 0.0
    @State var date = Date()
    @State var description = ""
    @State var category: Category?
    
    
    var currencyFormatter = NumberFormatter()
    
//    init() {
//        self.currencyFormatter.numberStyle = NumberFormatter.Style.currency
//
//        self.category = categoryViewModel.categories[0]
//        print(categoryViewModel.categories.count)
//    }

    
    var body: some View {
        Text("Add Expense")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        
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
                TextField("Amount", value: $amount, formatter: currencyFormatter)
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
                                .foregroundStyle(.yellow)

                            Spacer()
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
            .frame(height: .infinity)
            .padding()
            
            Button("Save") {
                //save expense here
            }
            
//            Spacer()
        }
        .padding()

    }
}

#Preview {
    AddExpense(expenseViewModel: ExpenseViewModel(store: ExpenseStore.testExpenseStore),
               categoryViewModel: CategoryViewModel(store: CategoryStore.testCategoryStore))
}