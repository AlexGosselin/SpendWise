//
//  CategoryStore.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import Observation

@Observable
final class CategoryStore {
    var categories: [Category]
    
    init(categories: [Category]) {
        self.categories = categories
    }
}

extension CategoryStore {
    static var testData = [
        Category(name: "No Category"),
        Category(name: "Food", colour: .orange, iconName: "carrot"),
        Category(name: "Rent", colour: .red, iconName: "house"),
        Category(name: "Car", colour: .blue, iconName: "car"),
        Category(name: "Other")
    ]
    
    static var testCategoryStore: CategoryStore = CategoryStore(categories: testData)
}
