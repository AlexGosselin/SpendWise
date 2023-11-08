//
//  ListCategory.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-11-03.
//

import SwiftUI

struct ListCategory: View {
    
    @Environment(CategoryViewModel.self) private var categoryViewModel: CategoryViewModel
    
    var body: some View {
        
        NavigationStack {
            List{
                ForEach(categoryViewModel.categories) { cat in
                    if cat.mainCategoryId == nil {
                                                                
                        CatgoryRow(cat: cat)
                        
                        ForEach(categoryViewModel.categories) { subcat in
                            
                            if let parentId = subcat.mainCategoryId {
                                if(parentId == cat.id) {
                                    ExtractedView(subcat: subcat)
                                }
                            }
                        }

                    }
                }
                
            }
        }
        .navigationTitle("List of Category")
    }
}

#Preview {
    ListCategory()
}

struct CatgoryRow: View {
    var cat: Category
    
    var body: some View {
        NavigationLink(destination: EditCategorySheet(category: cat)) {
            HStack {
                    Text(cat.name).font(.title)
                    cat.icon
            }.tag(Category?.some(cat))
        }
            
    }
}

struct ExtractedView: View {
    var subcat: Category
    
    var body: some View {
        NavigationLink(destination: EditCategorySheet(category: subcat)) {
            HStack {
                Text("- " + subcat.name)
                subcat.icon
            }.tag(Category?.some(subcat))
        }
    }
}
