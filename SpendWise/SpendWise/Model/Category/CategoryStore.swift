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
    
    init() {
        self.categories = CategoryStore.testData
    }
    
    init(categories: [Category]) {
        self.categories = categories
    }
}

extension CategoryStore {
//    static var testData = [
//        Category(id: 1, name: "Food", fontAwesomeIcon: .carrot),
//        Category(id: 2, name: "Rent", fontAwesomeIcon: .home),
//        Category(id: 3, name: "Car", fontAwesomeIcon: .car),
//        Category(id: 4, name: "Other", fontAwesomeIcon: .cog)
//    ]
    
    static var testData = Category.all
    
    static var testCategoryStore: CategoryStore = CategoryStore(categories: testData)
}
