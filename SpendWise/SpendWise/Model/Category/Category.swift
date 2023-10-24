//
//  Category.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import SwiftUI
import SwiftUIFontIcon

//struct Category: Identifiable, Decodable, Hashable {
//    var id: UUID
//    
//    var name: String
//    var colour: Color
//    var iconName: String
//    let icon: FontAwesomeCode
//    var mainCategoryId: Int?
    
//    var icon: Image { return iconName != "" ? Image(systemName: iconName) : Image(systemName: "x.square")}
    
//    init(id: UUID = UUID(), name: String, colour: Color = .indigo, iconName: String = "dollarsign.square") {
//        self.id = id
//        self.name = name
//        self.colour = colour
//        self.iconName = iconName
//    }
//}

struct Category: Identifiable {
    let id: UUID
    let name: String
    var colour: Color = .indigo
    let icon: FontAwesomeCode
    var mainCategoryId: UUID?
    
    var subcategories: [Category]? {
        Category.subCategories.filter { $0.mainCategoryId == id }
    }
}

extension Category {
    static let autoAndTransport = Category(id: UUID(), name: "Auto & Transport", icon: .car_alt)
    static let billsAndUtilities = Category(id: UUID(), name: "Bills & Utilities", icon: .file_invoice_dollar)
    static let entertainment = Category(id: UUID(), name: "Entertainment", icon: .film)
    static let feesAndCharges = Category(id: UUID(), name: "Fees & Charges", icon: .hand_holding_usd)
    static let foodAndDining = Category(id: UUID(), name: "Food & Dining", icon: .hamburger)
    static let home = Category(id: UUID(), name: "Home", icon: .home)
    static let income = Category(id: UUID(), name: "Income", icon: .dollar_sign)
    static let shopping = Category(id: UUID(), name: "Shopping", icon: .shopping_cart)
    static let transfer = Category(id: UUID(), name: "Transfer", icon: .exchange_alt)
    
    static let publicTransportation = Category(id: UUID(), name: "Public Transportation", icon: .bus, mainCategoryId: UUID())
    static let taxi = Category(id: UUID(), name: "Taxi", icon: .taxi, mainCategoryId: UUID())
    static let mobilePhone = Category(id: UUID(), name: "Mobile Phone", icon: .mobile_alt, mainCategoryId: UUID())
    static let moviesAndDVDs = Category(id: UUID(), name: "Movies & DVDs", icon: .film, mainCategoryId: UUID())
    static let bankFee = Category(id: UUID(), name: "Bank Fee", icon: .hand_holding_usd, mainCategoryId: UUID())
    static let financeCharge = Category(id: UUID(), name: "Finance Charge", icon: .hand_holding_usd, mainCategoryId: UUID())
    static let groceries = Category(id: UUID(), name: "Groceries", icon: .shopping_basket, mainCategoryId: UUID())
    static let restaurants = Category(id: UUID(), name: "Restaurants", icon: .utensils, mainCategoryId: UUID())
    static let rent = Category(id: UUID(), name: "Rent", icon: .house_user, mainCategoryId: UUID())
    static let homeSupplies = Category(id: UUID(), name: "Home Supplies", icon: .lightbulb, mainCategoryId: UUID())
    static let paycheque = Category(id: UUID(), name: "Paycheque", icon: .dollar_sign, mainCategoryId: UUID())
    static let software = Category(id: UUID(), name: "Software", icon: .icons, mainCategoryId: UUID())
    static let creditCardPayment = Category(id: UUID(), name: "Credit Card Payment", icon: .exchange_alt, mainCategoryId: UUID())
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
