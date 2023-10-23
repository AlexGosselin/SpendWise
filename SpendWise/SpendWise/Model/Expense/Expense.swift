//
//  Expense.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation

struct Expense: Identifiable {
    var id: UUID
    
    var title: String
    var amount: Double
    var category: Category
    var desc: String?
    var date: Date
    var interval: String
    
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
    
    init(id: UUID = UUID(), title: String, amount: Double, category: Category, desc: String? = nil, date: Date = Date(), interval: String) {
        self.id = id
        self.title = title
        self.amount = amount
        self.category = category
        self.desc = desc
        self.date = date
        self.interval = interval
    }
    
}
