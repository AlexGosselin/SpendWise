//
//  AppModel.swift
//  SpendWise
//
//  Created by ayomide olopha on 07/11/2023.
//

import SwiftUI
import Combine

class AppModel: ObservableObject {
    // Tab Bar
    @Published var showTab: Bool = true
    
    // Navigation Bar
    @Published var showNav: Bool = true
    
    // Modal
    @Published var showModal: Bool = false
    @Published var dismissModal: Bool = false
}

