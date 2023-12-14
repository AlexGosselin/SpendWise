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
    
    @State private var pageTitle: String = "Create Expense"
    
    @State private var expense: Expense = Expense()
    @State private var amountString = ""
    @State private var transactionType: TransactionType = TransactionType.credit
    
    @State private var animateTitle = false
    @State private var animateAmount = false
    @State private var animateCategory = false
    @State private var animateMerchant = false
    
    @FocusState private var titleFocused: Bool
    @FocusState private var amountFocused: Bool
    @FocusState private var descFocused: Bool
    @FocusState private var merchantFocused: Bool
    @FocusState private var institutionFocused: Bool
    @FocusState private var accountFocused: Bool
    
    var currencyFormatter = NumberFormatter()
    
    init() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        self.currencyFormatter = formatter
    }
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                Picker("Type", selection: $transactionType) {
                    Text("Outgoing").tag(TransactionType.credit)
                    Text("Incoming").tag(TransactionType.debit)
                }
                .pickerStyle(.segmented)
                .onChange(of: transactionType) {
                    if(transactionType == TransactionType.credit) {
                        pageTitle = "Create Expense"
                    } else if(transactionType == TransactionType.debit) {
                        pageTitle = "Create Transfer"
                    }
                }
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
                            .onChange(of: expense.title) {
                                expense.title = String(expense.title.prefix(20))
                            }
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
                            .onChange(of: amountString) {
                                amountString = String(amountString.prefix(11))
                            }
                    }
                    .padding()
                    
                    HStack {
                        Text("Category*")
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Picker("Category", selection: $expense.category) {
                                
                                Text("Select Category").tag(Category?.none)
                                Divider()
                                
                                ForEach(categoryViewModel.categories) { cat in
                                    if cat.mainCategoryId == nil {
                                                                                
                                        HStack {
                                            Text(cat.name).font(.title)
                                            cat.icon
                                        }.tag(Category?.some(cat))
                                        ForEach(categoryViewModel.categories) { subcat in
                                            
                                            if let parentId = subcat.mainCategoryId {
                                                if(parentId == cat.id) {
                                                    HStack {
                                                        Spacer()
                                                        Text("- " + subcat.name)
                                                        subcat.icon
                                                    }.tag(Category?.some(subcat))
                                                }
                                            }

//                                            Text(subcat.name)

                                            
                                        }
                                        Divider()

                                    }
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
                    
                    HStack {
                        Text("Merchant*")
                        Spacer()
                        TextField("Enter Merchant", text: $expense.merchant)
                            .focused($merchantFocused)
                            .multilineTextAlignment(.trailing)
                            .offset(x: animateMerchant ? -1 : 1)
                            .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value: animateMerchant)
                            .onChange(of: expense.merchant) {
                                expense.merchant = String(expense.merchant.prefix(20))
                            }
                    }
                    .padding()
                    
                    HStack {
                        Text("Institution")
                        Spacer()
                        TextField("i.e. Scotiabank", text: $expense.instituition)
                            .focused($institutionFocused)
                            .multilineTextAlignment(.trailing)
                            .onChange(of: expense.instituition) {
                                expense.instituition = String(expense.instituition.prefix(20))
                            }
//                            .offset(x: animateTitle ? -1 : 1)
//                            .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value: animateTitle)
                    }
                    .padding()
                    
                    HStack {
                        Text("Account")
                        Spacer()
                        TextField("Enter Account", text: $expense.account)
                            .focused($accountFocused)
                            .multilineTextAlignment(.trailing)
                            .onChange(of: expense.account) {
                                expense.account = String(expense.account.prefix(20))
                            }
//                            .offset(x: animateTitle ? -1 : 1)
//                            .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value: animateTitle)
                    }
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
                
                    PlainButton(buttonName: "Save", action: {
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
                        
                        if(expense.merchant == "") {
                            animateMerchant.toggle()
                            valid = false
                        }
                        
                        if(!valid) {
                            return
                        }
                        
                        expense.amount = doubleAmount
                        expense.transactionType = transactionType
                        expense.type = transactionType.rawValue
                        
                        if (transactionType == TransactionType.credit) {
                            expense.isExpense = true
                            expense.isTransfer = false
                        } else {
                            expense.isTransfer = true
                            expense.isExpense = false
                        }
                        
                        if let category = expense.category {
                            expense.categoryId = category.id
                            expense.categoryName = category.name
                        }
                        expense.updateDateString()
                        
                        
                        //                        let newExpense = Expense(id: 15, title: title, amount: doubleAmount, categoryId: 401, category: category!.name, desc: description, date: date.ISO8601Format(), type: "debit", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: true, isExpense: true)
                        //
                        expenseViewModel.addExpense(expense: expense)
                        print(expenseViewModel.store.expenses)
                        print("-----------------------")
                        print("-----------------------")
                        print("-----------------------")
                        print(expense)
                        dismiss()
                    })
                    
//                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 70)
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                PlainButton(buttonName: "Done", action: {
                    amountFocused = false
                    titleFocused = false
                    descFocused = false
                    merchantFocused = false
                    institutionFocused = false
                    accountFocused = false
                })
            }
        }
        .navigationTitle(pageTitle)
    }
}

#Preview {
    AddExpense()
}
