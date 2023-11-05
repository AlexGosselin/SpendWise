//
//  SettingsView.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-11-05.
//

import SwiftUI

struct SettingsView: View {
    
//    @Environment(CategoryViewModel.self) private var categoryViewModel: CategoryViewModel
//    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    
    @State private var showExpenseAlert = false
    @State private var showCategoryAlert = false
    @State private var showDataAlert = false
    
    var body: some View {
        
        ZStack {
            Color.background2.ignoresSafeArea()
            VStack {
                List {
                    Section(header: Text("Data")) {
                        Button("Delete All Expenses", role: .destructive) {
                            showExpenseAlert = true
                        }
                        .alert("Delete all expenses?", isPresented: $showExpenseAlert) {
                            Button("Cancel", role: .cancel){}
                            Button("Delete", role: .destructive){
                                
                            }
                        } message: {
                            Text("This cannot be undone!")
                        }
                        
                        Button("Delete All User Created Categories", role: .destructive) {
                            showCategoryAlert = true
                        }
                        .alert("Delete all user created categories?", isPresented: $showCategoryAlert) {
                            Button("Cancel", role: .cancel){}
                            Button("Delete", role: .destructive){
                                
                            }
                        } message: {
                            Text("This cannot be undone!")
                        }
                        
                        Button("Delete All User Data", role: .destructive) {
                            showDataAlert = true
                        }
                        .alert("Delete all user data?", isPresented: $showDataAlert) {
                            Button("Cancel", role: .cancel){}
                            Button("Delete", role: .destructive){
                                
                            }
                        } message: {
                            Text("This cannot be undone!")
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
        .navigationTitle("Settings")
    }
    
}

#Preview {
    SettingsView()
}
