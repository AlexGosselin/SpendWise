//
//  AppSettingsView.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-12-03.
//

import SwiftUI

struct AppSettingsView: View {
    @EnvironmentObject var userModel: UserViewModel
    @EnvironmentObject var themeManager: ThemeManagers
    
    @State private var isShowEditUserSheet: Bool = false
    var body: some View {
        List {
            NavigationLink(destination: EditThemeView(), label: {
                Label("Change Theme", systemImage: "paintpalette.fill")
                    .foregroundColor(themeManager.selectedtheme.primaryColor)
            })
            
            Label("Profile", systemImage: "person.circle.fill")
                .onTapGesture {
                    isShowEditUserSheet.toggle()
                }
                .foregroundColor(themeManager.selectedtheme.primaryColor)
            
            
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
