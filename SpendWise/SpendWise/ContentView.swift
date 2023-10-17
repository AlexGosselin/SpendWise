//
//  ContentView.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-09-30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: AddExpense()) {
                    Text("Add Expense")
                }
                NavigationLink(destination: AddCategory()) {
                    Text("Add Category")
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    ContentView()
}
