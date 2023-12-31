//
//  AddressModel.swift
//  SpendWise
//
//  Created by ayomide olopha on 07/11/2023.
//

import SwiftUI

struct Address: Identifiable, Decodable, Hashable {
    var id: Int
    var country: String
}
