//
//  AddExpense.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-16.
//

import SwiftUI
import SwiftUIFontIcon

struct AddExpense: View {
    
    @Environment(\.dismiss) var dismiss
    
//    @Environment(ExpenseStore.self) private var expenseStore: ExpenseStore
//    @Environment(CategoryStore.self) private var categoryStore: CategoryStore
    
    @Environment(CategoryViewModel.self) private var categoryViewModel: CategoryViewModel
    
//    @State var expenseViewModel: ExpenseViewModel?
    @EnvironmentObject var expenseViewModel: ExpenseViewModel

//    @State var categoryViewModel: CategoryViewModel?
    
    
//    @State var title = ""
//    @State var amount: String = ""
//    @State var date = Date()
//    @State var description = ""
//    @State var category: Category?
//    @State var repeatFrequency: String = ExpenseViewModel.repeatFrequencies[0]
    
    @State private var expense: Expense = Expense()
    @State private var amountString = ""
    
    @State private var animateTitle = false
    @State private var animateAmount = false
    @State private var animateCategory = false
    
    @FocusState private var titleFocused: Bool
    @FocusState private var amountFocused: Bool
    @FocusState private var descFocused: Bool
    
    var currencyFormatter = NumberFormatter()
    
    init() {
//        self.expenseViewModel = ExpenseViewModel(store: ExpenseStore())
//        self.categoryViewModel = CategoryViewModel(store: categoryStore)

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        self.currencyFormatter = formatter
        
    }
    
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
                        TextField("My Expense", text: $expense.title)
                            .focused($titleFocused)
                            .multilineTextAlignment(.trailing)
                            .offset(x: animateTitle ? -1 : 1)
                            .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value: animateTitle)
                    }
                    .padding()
                    
                    HStack {
                        Text("Amount*")
                        Spacer()
                        TextField("Amount", text: $amountString)
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
                            Picker("Category", selection: $expense.category) {
                                
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
                            
                            NavigationLink(destination: AddCategory()){
                                Text("New Category")
                            }
                        }
                    }
                    .padding()
                    
                    DatePicker("Date", selection: $expense.date, displayedComponents: [.date])
                        .padding()
                    
//                    HStack {
//                        Text("Repeat")
//                        Spacer()
//                        Picker("", selection: $repeatFrequency) {
//                            ForEach(ExpenseViewModel.repeatFrequencies, id: \.self) { f in
//                                Text(f)
//                            }
//                        }
//                        .pickerStyle(.menu)
//                        .cornerRadius(80.0)
//                        .background(RoundedRectangle(cornerRadius: 8.0).fill(.quinary))
//                    }
//                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Description")
                        TextEditor(text: $expense.desc)
                            .focused($descFocused)
                            .cornerRadius(8.0)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.quaternary, lineWidth: 2))
                            .frame(minHeight: 100)
                    }
                    .padding()
                    
                    Button("Save") {
                        
                        var valid = true
                        
                        if(expense.title == "") {
                            animateTitle.toggle()
                            valid = false
                        }
                        
                        if expense.category == nil {
                            print("category is null")
                            animateCategory.toggle()
                            valid = false
                        }
                        
                        
                        var doubleAmount = 0.0
                        if(amountString != "") {
                            if let dAmount = Double(amountString) {
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
                        
                        expense.amount = doubleAmount
                        
//                        let newExpense = Expense(id: 15, title: title, amount: doubleAmount, categoryId: 401, category: category!.name, desc: description, date: date.ISO8601Format(), type: "debit", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: true, isExpense: true)
//                        
                        print("here")
                        expenseViewModel.addExpense(expense: expense)
                        print(expenseViewModel.store.expenses)
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
    AddExpense()
}
