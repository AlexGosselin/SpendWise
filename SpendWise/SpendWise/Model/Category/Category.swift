//
//  Category.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import UIKit
import SwiftUI
import SwiftUIFontIcon

struct Category: Identifiable, Decodable, Hashable {
    var id: UUID
    
    var name: String
    var colour: Color
    var iconName: String
    let icon: FontAwesomeCode
    var mainCategoryId: Int?
    
//    var icon: Image { return iconName != "" ? Image(systemName: iconName) : Image(systemName: "x.square")}
    
//    init(id: UUID = UUID(), name: String, colour: Color = .indigo, iconName: String = "dollarsign.square") {
//        self.id = id
//        self.name = name
//        self.colour = colour
//        self.iconName = iconName
//    }
}
