//
//  Extension.swift
//  SpendWise
//
//  Created by ayomide olopha on 24/10/2023.
//

import Foundation
import SwiftUI

extension Color {
    static let background2 = Color("Background")
    static let icon2 = Color("Icon")
    static let text2 = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else { return Date() }
        
        return parsedDate
    }
}

extension Double {
    func roundedTo2Digits() -> Double {
        return (self * 100).rounded() / 100
    }
}
