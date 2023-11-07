//
//  Animation.swift
//  SpendWise
//
//  Created by ayomide olopha on 05/11/2023.
//

import SwiftUI

extension Animation {
    static let tabSelection = Animation.spring(response: 0.3, dampingFraction: 0.7)
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
}
