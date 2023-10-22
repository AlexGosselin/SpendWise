//
//  Category.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import UIKit
import SwiftUI

struct Category: Identifiable, Hashable {
    var id: UUID
    
    var name: String
    var colour: Color
    var iconName: String
    
    var icon: Image { return iconName != "" ? Image(systemName: iconName) : Image(systemName: "x.square")}
    
    init(id: UUID = UUID(), name: String, colour: Color = .black, iconName: String = "dollarsign.square") {
        self.id = id
        self.name = name
        self.colour = colour
        self.iconName = iconName
    }
}
