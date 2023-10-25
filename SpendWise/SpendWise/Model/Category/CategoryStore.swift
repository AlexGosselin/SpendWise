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
        Category(id: 1, name: "Food", icon: .carrot),
        Category(id: 2, name: "Rent", icon: .home),
        Category(id: 3, name: "Car", icon: .car),
        Category(id: 4, name: "Other", icon: .cog)
    ]
    
    static var testCategoryStore: CategoryStore = CategoryStore(categories: testData)
}
