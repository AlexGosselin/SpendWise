//
//  AddExpense.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-16.
//

import SwiftUI

struct AddExpense: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var expenseViewModel: ExpenseViewModel
    @State var categoryViewModel: CategoryViewModel
    
    @State var title = ""
    @State var amount: String = ""
    @State var date = Date()
    @State var description = ""
    @State var category: Category?
    @State var repeatFrequency: String = ExpenseViewModel.repeatFrequencies[0]
    
    @State var animateTitle = false
    @State var animateAmount = false
    @State var animateCategory = false
    
    @FocusState private var titleFocused: Bool
    @FocusState private var amountFocused: Bool
    @FocusState private var descFocused: Bool
    
    var currencyFormatter = NumberFormatter()
    
    var body: some View {
        
        
        NavigationView {
            
            ScrollView {
                
                Text("Create Expense")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .padding()
                
                VStack {
                    
                    HStack {
                        Text("Title*")
                        Spacer()
                        TextField("My Expense", text: $title)
                            .focused($titleFocused)
                            .multilineTextAlignment(.trailing)
                            .offset(x: animateTitle ? -1 : 1)
                            .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value: animateTitle)
                    }
                    .padding()
                    
                    HStack {
                        Text("Amount*")
                        Spacer()
                        TextField("Amount", text: $amount)
                            .focused($amountFocused)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                            .offset(x: animateAmount ? -1 : 1)
                            .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value: animateAmount)
                    }
                    .padding()
                    
                    HStack {
                        Text("Category*")
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Picker("Category", selection: $category) {
                                
                                Text("Select Category").tag(Category?.none)
                                
                                ForEach(categoryViewModel.categories) { cat in
                                    HStack {
                                        Text(cat.name)
                                        cat.icon
                                    }.tag(Category?.some(cat))
                                }
                            }
                            .pickerStyle(.menu)
                            .cornerRadius(80.0)
                            .background(RoundedRectangle(cornerRadius: 8.0).fill(.quinary))
                            .offset(x: animateCategory ? -1 : 1)
                            .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value: animateCategory)
                            
                            NavigationLink(destination: AddCategory(viewModel: categoryViewModel)){
                                Text("New Category")
                            }
                        }
                    }
                    .padding()
                    
                    DatePicker("Date", selection: $date, displayedComponents: [.date])
                        .padding()
                    
                    HStack {
                        Text("Repeat")
                        Spacer()
                        Picker("", selection: $repeatFrequency) {
                            ForEach(ExpenseViewModel.repeatFrequencies, id: \.self) { f in
                                Text(f)
                            }
                        }
                        .pickerStyle(.menu)
                        .cornerRadius(80.0)
                        .background(RoundedRectangle(cornerRadius: 8.0).fill(.quinary))
                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Description")
                        TextEditor(text: $description)
                            .focused($descFocused)
                            .cornerRadius(8.0)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.quaternary, lineWidth: 2))
                            .frame(minHeight: 100)
                    }
                    .padding()
                    
                    Button("Save") {
                        
                        var valid = true
                        
                        if(title == "") {
                            animateTitle.toggle()
                            valid = false
                        }
                        
                        if category == nil {
                            print("category is null")
                            animateCategory.toggle()
                            valid = false
                        }
                        
                        
                        var doubleAmount = 0.0
                        if(amount != "") {
                            if let dAmount = Double(amount) {
                                doubleAmount = dAmount
                            } else {
                                print("could not convert amount to double")
                                animateAmount.toggle()
                                valid = false
                            }
                        } else {
                            animateAmount.toggle()
                            valid = false
                        }
                        
                        if(!valid) {
                            return
                        }
                        
                        let newExpense = Expense(title: title, amount: doubleAmount, category: category!, desc: description, date: date.ISO8601Format(), interval: repeatFrequency, type: "debit", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isExpense: true, isTransfer: true)
                        
                        expenseViewModel.addExpense(expense: newExpense)
                        dismiss()
                    }
                    
//                    Spacer()
                }
                .padding(.horizontal)
            }
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    amountFocused = false
                    titleFocused = false
                    descFocused = false
                }
            }
        }
    }
}

#Preview {
    AddExpense(expenseViewModel: ExpenseViewModel(store: ExpenseStore.testExpenseStore),
               categoryViewModel: CategoryViewModel(store: CategoryStore.testCategoryStore))
}
