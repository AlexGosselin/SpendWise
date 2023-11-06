//
//  CategoryViewModel.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import Observation

@Observable
final class CategoryViewModel: ObservableObject {
    var store: CategoryStore
    
    var categories: [Category] { return store.categories }
    
    init(store: CategoryStore) {
        self.store = store
    }
    
    func addCategory(category: Category) {
        store.categories.append(category)
    }
    
    func clearUserCategories(){
        store.categories = CategoryStore.testData
    }
}
