//
//  SettingsView.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-11-05.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        ZStack {
            Color.background2.ignoresSafeArea()
            VStack {
                List {
                    Section(header: Text("Data")) {
                        Button("Delete All Expenses", role: .destructive) {
                            
                        }
                        
                        Button("Delete All User Created Categories", role: .destructive) {
                            
                        }
                        
                        Button("Delete All User Data", role: .destructive) {
                            
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
