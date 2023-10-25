//
//  PreviewData.swift
//  SpendWise
//
//  Created by ayomide olopha on 24/10/2023.
//

import Foundation
import SwiftUI

var transactionPreviewData = Expense(id: 13, title: "Payroll", amount: 23.66, categoryId: 401, category: Category(id: 405, name:"Software", icon: .shopping_bag).name, desc: "Visa Desjardins", date: "01/24/2022", interval: "yearly", type: "debit", merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: true, isExpense: true)

var expenseListPreviewData = [Expense](repeating: transactionPreviewData, count: 10)
