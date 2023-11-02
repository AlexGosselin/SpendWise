//
//  PreviewData.swift
//  SpendWise
//
//  Created by ayomide olopha on 24/10/2023.
//

import Foundation
import SwiftUI

var transactionPreviewData = Expense(id: 13, title: "Payroll", amount: 23.66, categoryId: 401, categoryName: Category(id: 405, name:"Software", fontAwesomeIcon: .shopping_bag).name, category: CategoryStore.testData[0], desc: "Visa Desjardins", dateString: "01/24/2022",  merchant: "Apple", instituition: "Scotia Bank", account: "Savings Account", isTransfer: true, isExpense: true)

var expenseListPreviewData = [Expense](repeating: transactionPreviewData, count: 10)

