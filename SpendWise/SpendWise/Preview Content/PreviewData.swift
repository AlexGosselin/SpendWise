//
//  PreviewData.swift
//  SpendWise
//
//  Created by ayomide olopha on 24/10/2023.
//

import Foundation
import SwiftUI

var transactionPreviewData = Expense(id: UUID(), title: "Payroll", amount: 23.66, category: Category(name:"Software"), desc: "Visa Desjardins", date: "01/24/2022", interval: "yearly", type: "debit", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isExpense: true, isTransfer: true)

var expenseListPreviewData = [Expense](repeating: transactionPreviewData, count: 10)
