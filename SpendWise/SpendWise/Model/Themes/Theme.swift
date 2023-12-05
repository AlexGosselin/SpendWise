//
//  Theme.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-12-03.
//

import Foundation
import SwiftUI

protocol Theme{
    var primaryColor: Color { get }
    var secondaryColor: Color { get }
}

struct AppTheme: Theme{
    var primaryColor: Color = Color.blue
    var secondaryColor: Color = Color.brown
}

