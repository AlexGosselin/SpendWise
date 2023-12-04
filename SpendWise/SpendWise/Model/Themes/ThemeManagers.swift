//
//  ThemeManagers.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-12-04.
//

import Foundation
import Observation
import SwiftUI

class ThemeManagers: ObservableObject{
    @Published var selectedtheme: Theme = AppTheme()
    
    //Ayo you meant to use this in the Onboarding screen to initialize the user
//    func setUser(){
//
//    }
     
    
    func editTheme(newTheme: Theme){
        selectedtheme = newTheme
    }
    
}
