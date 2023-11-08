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
        func editCategory(category: Category, id: Int){
            
            
            store.categories = store.categories.map{ cat in
                var modifiedCategories = cat
                
                if cat.id == id{
                    modifiedCategories.name = category.name
                    modifiedCategories.colour = category.colour
                    modifiedCategories.fontAwesomeIcon = category.fontAwesomeIcon
                    modifiedCategories.iconName = category.iconName
                    
                    if let mainCat = category.mainCategoryId{
                        modifiedCategories.mainCategoryId = mainCat
                    }
                }
                return modifiedCategories
            }
        }
        
        func getCategory(id: Int) -> Category?{
            if let cat = store.categories.first(where: { $0.id == id }){
                return cat
            }else{
                return nil
            }
        }
    }

