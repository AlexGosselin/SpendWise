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
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", fontAwesomeIcon: .file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Entertainment", fontAwesomeIcon: .film)
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", fontAwesomeIcon: .hand_holding_usd)
    static let foodAndDining = Category(id: 5, name: "Food & Dining", fontAwesomeIcon: .hamburger)
    static let home = Category(id: 6, name: "Home", fontAwesomeIcon: .home)
    static let income = Category(id: 7, name: "Income", fontAwesomeIcon: .dollar_sign)
    static let shopping = Category(id: 8, name: "Shopping", fontAwesomeIcon: .shopping_cart)
    static let transfer = Category(id: 9, name: "Transfer", fontAwesomeIcon: .exchange_alt)
    
    static let publicTransportation = Category(id: 101, name: "Public Transportation", fontAwesomeIcon: .bus, mainCategoryId: 1)
    static let taxi = Category(id: 102, name: "Taxi", fontAwesomeIcon: .taxi, mainCategoryId: 1)
    static let mobilePhone = Category(id: 201, name: "Mobile Phone", fontAwesomeIcon: .mobile_alt, mainCategoryId: 2)
    static let moviesAndDVDs = Category(id: 301, name: "Movies & DVDs", fontAwesomeIcon: .film, mainCategoryId: 3)
    static let bankFee = Category(id: 401, name: "Bank Fee", fontAwesomeIcon: .hand_holding_usd, mainCategoryId: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", fontAwesomeIcon: .hand_holding_usd, mainCategoryId: 4)
    static let groceries = Category(id: 501, name: "Groceries", fontAwesomeIcon: .shopping_basket, mainCategoryId: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", fontAwesomeIcon: .utensils, mainCategoryId: 5)
    static let rent = Category(id: 601, name: "Rent", fontAwesomeIcon: .house_user, mainCategoryId: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", fontAwesomeIcon: .lightbulb, mainCategoryId: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", fontAwesomeIcon: .dollar_sign, mainCategoryId: 7)
    static let software = Category(id: 801, name: "Software", fontAwesomeIcon: .icons, mainCategoryId: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", fontAwesomeIcon: .exchange_alt, mainCategoryId: 9)
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
