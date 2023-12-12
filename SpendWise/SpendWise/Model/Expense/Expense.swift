//
//  Expense.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import SwiftUIFontIcon
import SwiftData

@Model
class Expense: Identifiable, Hashable {
    var id: Int
    var title: String
    var amount: Double
    var categoryId: Int
    var categoryName: String
    var category: Category?
    var desc: String
    var dateString: String
    var date: Date
//    var interval: String
    var transactionType: TransactionType
    var type: TransactionType.RawValue
    var merchant: String
    var instituition: String
    var account: String
    var isTransfer: Bool
    var isExpense: Bool
    
    init(id: Int = Int.random(in: 0...Int.max),
         title: String = "",
         amount: Double = 0.0,
         categoryId: Int = -1, 
         categoryName: String = "",
         category: Category? = nil, 
         desc: String = "",
         dateString: String = "",
         date: Date = Date(),
         transactionType: TransactionType = TransactionType.credit,
         merchant: String = "",
         instituition: String = "",
         account: String = "",
         isTransfer: Bool = false,
         isExpense: Bool = false) {
        self.id = id
        self.title = title
        self.amount = amount
        self.categoryId = categoryId
        self.categoryName = categoryName
        self.category = category
        self.desc = desc
        self.dateString = dateString
        self.date = date
        self.transactionType = transactionType
        self.type = transactionType.rawValue
        self.merchant = merchant
        self.instituition = instituition
        self.account = account
        self.isTransfer = isTransfer
        self.isExpense = isExpense
    }
    
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
    
    func updateDateString() {
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

enum TransactionType: String, Codable {
    case debit = "debit"
    case credit = "credit"
}
