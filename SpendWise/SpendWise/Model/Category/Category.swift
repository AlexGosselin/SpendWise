//
//  Category.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import SwiftUI
import SwiftUIFontIcon

struct Category: Identifiable, Hashable {
    let id: Int
    var name: String
    var colour: Color = .indigo
    var fontAwesomeIcon: FontAwesomeCode
    var iconName: String = "dollarsign.square"
    var mainCategoryId: Int?
    
    var subcategories: [Category]? {
        Category.subCategories.filter { $0.mainCategoryId == id }
    }
    
    var icon: Image {
        return Image(systemName: iconName)
    }
}

extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", fontAwesomeIcon: .car_alt, iconName: "car")
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", fontAwesomeIcon: .file_invoice_dollar, iconName: "poweroutlet.type.b")
    static let entertainment = Category(id: 3, name: "Entertainment", fontAwesomeIcon: .film, iconName: "movieclapper")
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", fontAwesomeIcon: .hand_holding_usd, iconName: "dollarsign")
    static let foodAndDining = Category(id: 5, name: "Food & Dining", fontAwesomeIcon: .hamburger, iconName: "fork.knife")
    static let home = Category(id: 6, name: "Home", fontAwesomeIcon: .home, iconName: "house.fill")
    static let income = Category(id: 7, name: "Income", fontAwesomeIcon: .dollar_sign, iconName: "banknote")
    static let shopping = Category(id: 8, name: "Shopping", fontAwesomeIcon: .shopping_cart, iconName: "cart")
    static let transfer = Category(id: 9, name: "Transfer", fontAwesomeIcon: .exchange_alt, iconName: "dollarsign.arrow.circlepath")
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", fontAwesomeIcon: .bus, iconName: "tram", mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", fontAwesomeIcon: .taxi, iconName: "car.side", mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", fontAwesomeIcon: .mobile_alt, iconName: "iphone", mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", fontAwesomeIcon: .film, iconName: "opticaldisc", mainCategoryId: 3)
    static let bankFee = Category(id: 401, name: "Bank Fee", fontAwesomeIcon: .hand_holding_usd, iconName: "dollarsign", mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", fontAwesomeIcon: .hand_holding_usd, iconName: "dollarsign", mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", fontAwesomeIcon: .shopping_basket, iconName: "basket", mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", fontAwesomeIcon: .utensils, iconName: "takeoutbag.and.cup.and.straw", mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", fontAwesomeIcon: .house_user, iconName: "house", mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", fontAwesomeIcon: .lightbulb, iconName: "lightbulb", mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", fontAwesomeIcon: .dollar_sign, iconName: "banknote", mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", fontAwesomeIcon: .icons, iconName: "apple.terminal", mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", fontAwesomeIcon: .exchange_alt, iconName: "creditcard", mainCategoryId: 9)
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
