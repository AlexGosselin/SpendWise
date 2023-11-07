//
//  TabModel.swift
//  SpendWise
//
//  Created by ayomide olopha on 05/11/2023.
//

import SwiftUI

struct TabItem: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    var color: Color
    var selection: Tab
}

var tabItems = [
    TabItem(name: "Home", icon: "house", color: .teal, selection: .home),
    TabItem(name: "Explore", icon: "magnifyingglass", color: .blue, selection: .explore),
    TabItem(name: "Notifications", icon: "bell", color: .red, selection: .notifications),
    TabItem(name: "Settings", icon: "gear", color: .pink, selection: .settings)
]

enum Tab: String {
    case home
    case explore
    case notifications
    case settings
}

