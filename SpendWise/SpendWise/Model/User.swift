//
//  User.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-12-03.
//

import Foundation

struct User: Identifiable{
    var id: UUID = UUID()
    var name: String = ""
    var address: Address = AddressStore.addressData[0]
    
    init(){
        self.name = "User 1"
        self.address = AddressStore.addressData[0]
    }
    
    init(id: UUID = UUID(), name: String, address: Address) {
        self.id = id
        self.name = name
        self.address = address
    }
}
