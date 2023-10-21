//
//  CategoryViewModel.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-21.
//

import Foundation
import Observation

@Observable
final class CategoryViewModel {
    var store: CategoryStore
    
    var categories: [Category] { return store.categories }
    
    init(store: CategoryStore) {
        self.store = store
    }
}
