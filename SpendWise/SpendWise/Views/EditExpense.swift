//
//  EditExpense.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-11-02.
//

import SwiftUI

struct EditExpense: View {
    
    @Environment(\.dismiss) var dismiss
    
    var expense: Expense
    @State private var newExpense: Expense = Expense()
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    @Environment(CategoryViewModel.self) private var categoryViewModel: CategoryViewModel
    
    @State private var title: String
    @State private var amount: String
    @State private var date: Date
    @State private var description: String
    @State private var category: Category?
    @State private var merchant: String
    @State private var instituition: String
    @State private var account: String
    @State private var transactionType: TransactionType
    
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
    
    init(expense: Expense) {
        self.expense = expense
        self._title = State(initialValue: expense.title)
        self._amount = State(initialValue: String(expense.amount))
        self._date = State(initialValue: expense.date)
        self._description = State(initialValue: expense.desc)
        self._merchant = State(initialValue: expense.merchant)
        self._instituition = State(initialValue: expense.instituition)
        self._account = State(initialValue: expense.account)
        self._transactionType = State(initialValue: expense.transactionType)
        self._category = State(initialValue: expense.category)
    }
    
    
    var body: some View {
        ScrollView {
            VStack {
                
                Text("Edit Expense")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                HStack {
                    Text("Title*")
                    Spacer()
                    TextField("My Expense", text: $title)
                        .focused($titleFocused)
                        .multilineTextAlignment(.trailing)
                        .offset(x: animateTitle ? -1 : 1)
                        .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value: animateTitle)
                        .onChange(of: title) {
                            title = String(title.prefix(20))
                        }
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
                        .onChange(of: amount) {
                            amount = String(amount.prefix(11))
                        }
                }
                .padding()
                
                HStack {
                    Text("Category*")
                    Spacer()
                    
                        Picker("Category", selection: $category) {
                            
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
                }
                .padding()
                
                HStack {
                    Text("Transaction Type ")
                    
                    Spacer()
                    Picker("Type", selection: $transactionType){
                             Text("Credit").tag(TransactionType.credit)
                             Text("Debit").tag(TransactionType.debit)
                    }
//                    .pickerStyle(.inline)
//                    .padding(.top, 0)
                }
                .padding()
                
                DatePicker("Date", selection: $date, displayedComponents: [.date])
                    .padding()
                
                HStack {
                    Text("Merchant*")
                    Spacer()
                    TextField("Enter Merchant", text: $merchant)
                        .focused($merchantFocused)
                        .multilineTextAlignment(.trailing)
                        .offset(x: animateMerchant ? -1 : 1)
                        .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value: animateMerchant)
                        .onChange(of: merchant) {
                            merchant = String(merchant.prefix(20))
                        }
                }
                .padding()
                
                HStack {
                    Text("Institution")
                    Spacer()
                    TextField("i.e. Scotiabank", text: $instituition)
                        .focused($institutionFocused)
                        .multilineTextAlignment(.trailing)
                        .onChange(of: instituition) {
                            instituition = String(instituition.prefix(20))
                        }
                }
                .padding()
                
                HStack {
                    Text("Account")
                    Spacer()
                    TextField("Enter Account", text: $account)
                        .focused($accountFocused)
                        .multilineTextAlignment(.trailing)
                        .onChange(of: account) {
                            account = String(account.prefix(20))
                        }
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
                    TextEditor(text: $description)
                        .focused($descFocused)
                        .cornerRadius(8.0)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(.quaternary, lineWidth: 2))
                        .frame(minHeight: 100)
                }
                .padding()
                
                
                PlainButton(buttonName: "Done", action: {
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
                    
                    if(merchant == "") {
                        animateMerchant.toggle()
                        valid = false
                    }
                    
                    if(!valid) {
                        return
                    }
                    
                    newExpense.title = title
                    newExpense.amount = doubleAmount
                    newExpense.date = date
                    newExpense.desc = description
                    newExpense.merchant = merchant
                    newExpense.instituition = instituition
                    newExpense.account = account
                    newExpense.transactionType = transactionType
                    newExpense.type = transactionType.rawValue
                    newExpense.category = category
                    
                    if (transactionType == TransactionType.credit) {
                        newExpense.isExpense = true
                        newExpense.isTransfer = false
                    } else {
                        newExpense.isTransfer = true
                        newExpense.isExpense = false
                    }
                    
                    if let category = newExpense.category {
                        newExpense.categoryId = category.id
                        newExpense.categoryName = category.name
                    }
                    
                    newExpense.updateDateString()
                    
                    
                    expenseViewModel.editExpense(expense: newExpense, id: expense.id)
                    
//                    print("Edir=t variable")
//                    print(expenseViewModel.store.expenses)
                    
                    dismiss()
                })
                
                
            }
        }
    }
}

#Preview {
    EditExpense(expense: ExpenseStore.testExpenseStore.expenses[2])
}
