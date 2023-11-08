//
//  Expense.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import SwiftUIFontIcon

struct Expense: Identifiable, Hashable {
    var id: Int = Int.random(in: 0...Int.max)
    var title: String = ""
    var amount: Double = 0.0
    var categoryId: Int = -1
    var categoryName: String = ""
    var category: Category?
    var desc: String = ""
    var dateString: String = ""
    var date: Date = Date()
//    var interval: String
    var transactionType: TransactionType = TransactionType.credit
    var type: TransactionType.RawValue = TransactionType.credit.rawValue
    var merchant: String = ""
    var instituition: String = ""
    var account: String = ""
    var isTransfer: Bool = false
    var isExpense: Bool = false
    
//    var timer: Timer?
    
//    mutating func setTimer(timer: Timer) {
//        self.timer = timer
//    }
//    
//    mutating func stopRepeating() {
//        self.interval = "None"
//        
//        if let timer = timer {
//            timer.invalidate()
//        }
//    }
    
//    var icon: FontAwesomeCode {
//        if let category = Category.all.first(where: { $0.id == categoryId }) {
//            return category.icon
//        }
//        
//        return .question
//    }
    
    mutating func updateDateString() {
        dateString = date.formatted(date: .numeric, time: .omitted)
    }
    
    var dateParsed: Date {
        dateString.dateParsed()
    }
    
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
    
    var categoryItem: Category {
        if let category = Category.all.first(where: { $0.id == categoryId }) {
            return category
        }
        
        return .shopping
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
