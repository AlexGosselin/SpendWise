//
//  FullButton.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-12-04.
//

import SwiftUI

struct FullButton: View {
    let buttonName: String
    let action: () -> Void
    
    @EnvironmentObject var themeManager: ThemeManagers
    
    var body: some View {
        Button(buttonName){
            self.action()
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(themeManager.selectedtheme.primaryColor)
        .foregroundColor(.white)
        .cornerRadius(10)
    }
}

#Preview {
    FullButton(buttonName: "Save", action: {})
}
