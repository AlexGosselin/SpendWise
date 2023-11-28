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


final class ExpenseViewModel: ObservableObject {
    @Published var transactions: [Expense] = []
    var store: ExpenseStore
//    static let repeatFrequencies = ["Never", "Daily", "Weekly", "Monthly", "Yearly"]
    
    // MARK: Alex this will be uncommented later
//    @Published var expenses: [Expense] { return store.expenses }
    
    init(store: ExpenseStore) {
        self.store = store
        populateExpense()
    }
    
    func addExpense(expense: Expense) {
//        var newExpense = expense
//        var repeatingExpense = expense
//        var timer: Timer?
//        
//        switch expense.interval {
//        case "Daily":
//            timer = Timer.scheduledTimer(withTimeInterval: 86400, repeats: true) { timer in
//                repeatingExpense.date = Date().ISO8601Format()
//                repeatingExpense.setTimer(timer: timer)
//                self.store.expenses.append(repeatingExpense)
//            }
//            break
//        case "Weekly":
//            timer = Timer.scheduledTimer(withTimeInterval: 604800, repeats: true) { timer in
//                repeatingExpense.date = Date().ISO8601Format()
//                repeatingExpense.setTimer(timer: timer)
//                self.store.expenses.append(repeatingExpense)
//            }
//            break
//        case "Monthly":
//            timer = Timer.scheduledTimer(withTimeInterval: 2628288, repeats: true) { timer in
//                repeatingExpense.date = Date().ISO8601Format()
//                repeatingExpense.setTimer(timer: timer)
//                self.store.expenses.append(repeatingExpense)
//            }
//            break
//        case "Yearly":
//            timer = Timer.scheduledTimer(withTimeInterval: 31536000, repeats: true) { timer in
//                repeatingExpense.date = Date().ISO8601Format()
//                repeatingExpense.setTimer(timer: timer)
//                self.store.expenses.append(repeatingExpense)
//            }
//            break
//        default: break
//            
//        }
//        
//        if let timer = timer {
//            newExpense.setTimer(timer: timer)
//        }
        store.expenses.append(expense)
        transactions.append(expense)
    }
    
    func groupExpenseByMonth() -> ExpenseGroup {
        guard !store.expenses.isEmpty else { return [:] }
        
        let groupedTransactions = ExpenseGroup(grouping: store.expenses) { $0.month }
        
        return groupedTransactions
    }
    
    func editExpense(expense: Expense, id: Int){

        
        store.expenses = store.expenses.map{ exp in
            var modifiedExpenses = exp
            
            if exp.id == id{
                modifiedExpenses.title = expense.title
                modifiedExpenses.amount = expense.amount
                modifiedExpenses.date = expense.date
                modifiedExpenses.desc = expense.desc
                modifiedExpenses.merchant = expense.merchant
                modifiedExpenses.instituition = expense.instituition
                modifiedExpenses.account = expense.account
                modifiedExpenses.transactionType = expense.transactionType
                modifiedExpenses.type =  expense.type
                modifiedExpenses.isExpense =  expense.isExpense
                modifiedExpenses.isTransfer =  expense.isTransfer
                modifiedExpenses.dateString =  expense.dateString
                modifiedExpenses.category =  expense.category
                modifiedExpenses.categoryId = expense.categoryId
                modifiedExpenses.categoryName = expense.categoryName
            }
            return modifiedExpenses
        }
        
    }
    
    func populateExpense() {
        self.transactions = expenseListPreviewData
        print(expenseListPreviewData)
    }
    
    func accumulateTransactions() -> ExpensePrefixSum {
        print("accumulateTransactions")
        guard !transactions.isEmpty else { return [] }
        
        let today = "02/17/2022".dateParsed() // Date()
        let dateInterval = Calendar.current.dateInterval(of: .month, for: today)!
        print("dateInterval", dateInterval)
        
        var sum: Double = .zero
        var cumulativeSum = ExpensePrefixSum()
        
        for date in stride(from: dateInterval.start, to: today, by: 60 * 60 * 24) {
            let dailyExpenses = transactions.filter { $0.dateParsed == date && $0.isExpense }
            let dailyTotal = dailyExpenses.reduce(into: 0) { $0 - $1.signedAmount }
            
            sum += dailyTotal
            sum = sum.roundedTo2Digits()
            cumulativeSum.append((date.formatted(), sum))
            print(date.formatted(), "dailyTotal:", dailyTotal, "sum:", sum)
        }
        
        return cumulativeSum
    }
    
    func getMonthlyExpenses() -> Double {
        
        var sum = 0.0
        let currentDate = Calendar.current.dateComponents([.day, .month, .year], from: Date())
                
        store.expenses.forEach({ e in
            let expenseDate = Calendar.current.dateComponents([.day, .month, .year], from: e.date)
            print(expenseDate.month!)

            if(currentDate.month == expenseDate.month) {
                if(e.isExpense) {
                    sum += e.amount
                }
            }
        })
        
        return sum
    }
    
    func getMonthlyDebits() -> Double {
        
        var sum = 0.0
        let currentDate = Calendar.current.dateComponents([.day, .month, .year], from: Date())
                
        store.expenses.forEach({ e in
            let expenseDate = Calendar.current.dateComponents([.day, .month, .year], from: e.date)
            print(expenseDate.month!)

            if(currentDate.month == expenseDate.month) {
                if(e.isTransfer) {
                    sum += e.amount
                }
            }
        })
        
        return sum
    }
    
    func getExpenses(startDate: Date, endDate: Date) -> [Expense] {
        var filteredExpenses: [Expense] = []
        
        if(startDate < endDate) {
            return []
        }
        
//        store.expenses.forEach({ e in
//            if(e.date >= startDate && e.date <= endDate) {
//                filteredExpenses.append(e)
//            }
//        })
        
        filteredExpenses = store.expenses.filter({ e in
            e.date >= startDate && e.date <= endDate
        })
        
        return filteredExpenses
    }
    
    func clearExpenses() {
        self.transactions = []
        self.store.expenses = []
    }
}
