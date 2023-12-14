//
//  PlainButton.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-12-04.
//

import SwiftUI

struct PlainButton: View {
    let buttonName: String
    let action: () -> Void
    
    @EnvironmentObject var themeManager: ThemeManagers
    
    var body: some View {
        Button(buttonName){
            self.action()
        }
        .padding()
        .foregroundColor(themeManager.selectedtheme.primaryColor)
    }
}

#Preview {
    PlainButton(buttonName: "button", action: {})
}
