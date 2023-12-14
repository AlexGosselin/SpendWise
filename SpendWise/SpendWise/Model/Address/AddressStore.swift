//
//  AddressStore.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-12-03.
//

import Foundation

@Observable
final class AddressStore{
    var address: [Address]
    
    init(address: [Address]) {
        self.address = address
    }
}

extension AddressStore {
    static var addressData = [
        Address(id: 1, country: "Canada"),
        Address(id: 2, country: "USA"),
        Address(id: 3, country: "India"),
    ]
    
    static var addressStoreData: AddressStore = AddressStore(address: addressData)
}
