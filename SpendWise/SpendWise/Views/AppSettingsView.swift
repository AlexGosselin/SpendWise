//
//  AppSettingsView.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-12-03.
//

import SwiftUI

struct AppSettingsView: View {
    @EnvironmentObject var userModel: UserViewModel
    
    @State private var isShowEditUserSheet: Bool = false
    var body: some View {
        List {
            Label("Change Theme", systemImage: "paintpalette.fill")
            
            Label("Profile", systemImage: "person.circle.fill")
                .onTapGesture {
                    isShowEditUserSheet.toggle()
                }
            
            
        }
        .sheet(isPresented: $isShowEditUserSheet, content: {
            EditUserSheet(user: userModel.user)
                .presentationDragIndicator(.visible)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .presentationDetents([ .fraction(0.5)])
                .padding()
        })
    }
}

#Preview {
    AppSettingsView()
        .environmentObject(UserViewModel())
}
