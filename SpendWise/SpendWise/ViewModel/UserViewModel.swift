//
//  AddressViewModel.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-12-03.
//

import Foundation
import Observation

final class UserViewModel: ObservableObject{
    @Published var user = User(name: "User 1", address: AddressStore.addressData[0])
    
    //Ayo you meant to use this in the Onboarding screen to initialize the user
    func setUser(){
        
    }
    
    func editUser(newUser: User){
        user = newUser
    }
    
}
