//
//  Expense.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import SwiftUIFontIcon

struct Expense: Identifiable, Decodable, Hashable {
    var id: Int
    var title: String
    var amount: Double
    var categoryId: Int
    var category: String
    var desc: String?
    var date: String
    var interval: String
    let type: TransactionType.RawValue
    var merchant: String
    var instituition: String
    var account: String
    var isTransfer: Bool
    var isExpense: Bool
    
//    private var timer: Timer?
    
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
    
    var icon: FontAwesomeCode {
        if let category = Category.all.first(where: { $0.id == categoryId }) {
            return category.icon
        }
        
        return .question
    }
    
    var dateParsed: Date {
        date.dateParsed()
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

    
//    init(id: UUID = UUID(), title: String, amount: Double, category: Category, desc: String? = nil, date: String, interval: String, type: TransactionType.RawValue, merchant: String, dateParsed: Date? = nil, instituition: String, account: String, isExpense: Bool, isTransfer: Bool) {
//        self.id = id
//        self.title = title
//        self.amount = amount
//        self.category = category
//        self.desc = desc
//        self.date = date
//        self.interval = interval
//        self.type = type
//        self.merchant = merchant
//        self.instituition = instituition
//        self.account = account
//        self.isExpense = isExpense
//        self.isTransfer = isTransfer
//    }

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
