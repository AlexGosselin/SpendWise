//
//  ExpenseViewModel.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import Observation
import Combine
import Collections

typealias ExpenseGroup = OrderedDictionary<String, [Expense]>
typealias ExpensePrefixSum = [(String, Double)]

@Observable
final class ExpenseViewModel: ObservableObject {
    @Published var transactions2: [Expense] = []
    var store: ExpenseStore
    static let repeatFrequencies = ["Never", "Daily", "Weekly", "Monthly", "Yearly"]
    
    var expenses: [Expense] { return store.expenses }
    
    init(store: ExpenseStore) {
        self.store = store
    }
    
    func addExpense(expense: Expense) {
        var newExpense = expense
        var repeatingExpense = expense
        var timer: Timer?
        
        switch expense.interval {
        case "Daily":
            timer = Timer.scheduledTimer(withTimeInterval: 86400, repeats: true) { timer in
                repeatingExpense.date = Date().ISO8601Format()
                repeatingExpense.setTimer(timer: timer)
                self.store.expenses.append(repeatingExpense)
            }
            break
        case "Weekly":
            timer = Timer.scheduledTimer(withTimeInterval: 604800, repeats: true) { timer in
                repeatingExpense.date = Date().ISO8601Format()
                repeatingExpense.setTimer(timer: timer)
                self.store.expenses.append(repeatingExpense)
            }
            break
        case "Monthly":
            timer = Timer.scheduledTimer(withTimeInterval: 2628288, repeats: true) { timer in
                repeatingExpense.date = Date().ISO8601Format()
                repeatingExpense.setTimer(timer: timer)
                self.store.expenses.append(repeatingExpense)
            }
            break
        case "Yearly":
            timer = Timer.scheduledTimer(withTimeInterval: 31536000, repeats: true) { timer in
                repeatingExpense.date = Date().ISO8601Format()
                repeatingExpense.setTimer(timer: timer)
                self.store.expenses.append(repeatingExpense)
            }
            break
        default: break
            
        }
        
        if let timer = timer {
            newExpense.setTimer(timer: timer)
        }
        store.expenses.append(newExpense)
    }
    
    func accumulateTransactions() -> ExpensePrefixSum {
        print("accumulateTransactions")
        guard !expenses.isEmpty else { return [] }
        
        let today = "02/17/2022".dateParsed() // Date()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("dateInterval", dateInterval)
        
        var sum: Double = .zero
        var cumulativeSum = ExpensePrefixSum()
        
        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
            let dailyExpenses = expenses.filter { $0.dateParsed == date && $0.isExpense }
            let dailyTotal = dailyExpenses.reduce(into: 0) { $0 - $1.amount }
            
            sum += dailyTotal
            sum = sum.roundedTo2Digits()
            cumulativeSum.append((date.formatted(), sum))
            print(date.formatted(), "dailyTotal:", dailyTotal, "sum:", sum)
        }
        
        return cumulativeSum
    }
}
