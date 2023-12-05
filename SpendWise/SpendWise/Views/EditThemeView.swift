//
//  EditThemeView.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-12-03.
//

import SwiftUI

struct EditThemeView: View {
    @EnvironmentObject var themeManager: ThemeManagers
    
    @State var primaryColor: Color = Color.red
    @State var secondaryColor: Color = Color.green
    
//    @State var newTheme = Theme()
    
//    var themeManagers: ThemeManagers
    
    var body: some View {
        ColorPicker("Change Primary Color", selection: $primaryColor, supportsOpacity: false)
            .padding()
        
        ColorPicker("Change Secondary Color", selection: $secondaryColor, supportsOpacity: false)
            .padding()
        
        Button("Change Theme") {
            let newTheme = AppTheme(primaryColor: primaryColor, secondaryColor: secondaryColor)
                            themeManager.selectedtheme = newTheme
//            newTheme.primaryColor = primaryColour
//            newTheme.secondaryColor = Color.pink
//            
            themeManager.editTheme(newTheme: newTheme)
        }
        .padding()
        .foregroundColor(themeManager.selectedtheme.secondaryColor)
        .background(themeManager.selectedtheme.primaryColor)
        .cornerRadius(10)
    }
}

#Preview {
    EditThemeView()
}
