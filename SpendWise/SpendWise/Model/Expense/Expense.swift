//
//  Expense.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation

struct Expense: Identifiable, Decodable, Hashable {
    var id: UUID
    
    var title: String
    var amount: Double
    var category: Category
    var desc: String?
    var date: String
    var interval: String
    let type: TransactionType.RawValue
    var merchant: String
    var instituition: String
    var account: String
    var isTransfer: Bool
    var isExpense: Bool
    
    private var timer: Timer?
    
    mutating func setTimer(timer: Timer) {
        self.timer = timer
    }
    
    mutating func stopRepeating() {
        self.interval = "None"
        
        if let timer = timer {
            timer.invalidate()
        }
    }
    
    var dateParsed: Date {
        date.dateParsed()
    }

    
    init(id: UUID = UUID(), title: String, amount: Double, category: Category, desc: String? = nil, date: String, interval: String, type: TransactionType.RawValue, merchant: String, dateParsed: Date? = nil, instituition: String, account: String, isExpense: Bool, isTransfer: Bool) {
        self.id = id
        self.title = title
        self.amount = amount
        self.category = category
        self.desc = desc
        self.date = date
        self.interval = interval
        self.type = type
        self.merchant = merchant
        self.instituition = instituition
        self.account = account
        self.isExpense = isExpense
        self.isTransfer = isTransfer
    }
    
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}
