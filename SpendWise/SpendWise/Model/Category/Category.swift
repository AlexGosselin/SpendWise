//
//  Category.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import SwiftUI
import SwiftUIFontIcon
import SwiftData

@Model
class Category: Identifiable, Hashable {
    let id: Int
    var name: String
//    var colour: Color
//    var fontAwesomeIcon: FontAwesomeCode
    var iconName: String = "dollarsign.square"
    var mainCategoryId: Int?
    
    init(id: Int,
         name: String,
         colour: Color = Color.black, 
         iconName: String = "dollarsign.square",
         mainCategoryId: Int? = nil) {
        self.id = id
        self.name = name
//        self.colour = colour
//        self.fontAwesomeIcon = fontAwesomeIcon
        self.iconName = iconName
        self.mainCategoryId = mainCategoryId
    }
    
    var subcategories: [Category]? {
        Category.subCategories.filter { $0.mainCategoryId == id }
    }
    
    var icon: Image {
        return Image(systemName: iconName)
    }
}

extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", iconName: "car")
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", iconName: "poweroutlet.type.b")
    static let entertainment = Category(id: 3, name: "Entertainment", iconName: "movieclapper")
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", iconName: "dollarsign")
    static let foodAndDining = Category(id: 5, name: "Food & Dining", iconName: "fork.knife")
    static let home = Category(id: 6, name: "Home",  iconName: "house.fill")
    static let income = Category(id: 7, name: "Income", iconName: "banknote")
    static let shopping = Category(id: 8, name: "Shopping", iconName: "cart")
    static let transfer = Category(id: 9, name: "Transfer", iconName: "dollarsign.arrow.circlepath")
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", iconName: "tram", mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", iconName: "car.side", mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", iconName: "iphone", mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", iconName: "opticaldisc", mainCategoryId: 3)
    static let bankFee = Category(id: 401, name: "Bank Fee", iconName: "dollarsign", mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", iconName: "dollarsign", mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries",  iconName: "basket", mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants",  iconName: "takeoutbag.and.cup.and.straw", mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent",  iconName: "house", mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies",  iconName: "lightbulb", mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", iconName: "banknote", mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", iconName: "apple.terminal", mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", iconName: "creditcard", mainCategoryId: 9)
}

extension Category {
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilePhone,
        .moviesAndDVDs,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment
    ]
    
    static let all: [Category] = categories + subCategories
}
