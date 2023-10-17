//
//  AddExpense.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-16.
//

import SwiftUI

struct AddExpense: View {
    
    @State var title = ""
    @State var amount = 0.0
    @State var date = Date()
    @State var description = ""
    @State var category = ""
    
    var categories = ["cat1", "cat2", "cat3hgdlhdjfsla"]
    
    var currencyFormatter = NumberFormatter()
    
    init() {
        self.currencyFormatter.numberStyle = NumberFormatter.Style.currency
    }
    
    
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
                Picker("", selection: $category) {
                    ForEach(categories, id: \.self) { cat in
                        Text(cat)
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
                //save expense here
            }
            
            Spacer()
        }
        .padding()

    }
}

#Preview {
    AddExpense()
}
