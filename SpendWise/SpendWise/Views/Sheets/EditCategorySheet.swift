//
//  EditCategorySheet.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-11-03.
//

import SwiftUI
import SwiftUIFontIcon

struct EditCategorySheet: View {
    @Environment(\.dismiss) var dismiss
    
    @Environment(CategoryViewModel.self) private var categoryViewModel: CategoryViewModel
    
    var category: Category
    
    @State private var name: String
    @State private var colour: Color
    @State private var fontAwesomeIcon: FontAwesomeCode
    @State private var iconName: String
    @State var parentCategory: Category?
    @State private var mainCategoryId: Int?
    
    @State private var subcategories: [Category]?
    
    @State private var icon: Image
    
    @State var animateName = false
    @FocusState var isFocused: Bool
    
    init(category: Category) {
        self.category = category
        self._name = State(initialValue: category.name)
        self._colour = State(initialValue: category.colour)
        self._fontAwesomeIcon = State(initialValue: category.fontAwesomeIcon)
        self._iconName = State(initialValue: category.iconName)
        self._mainCategoryId = State(initialValue: category.mainCategoryId)
        self._subcategories = State(initialValue: category.subcategories)
        self._icon = State(initialValue: category.icon)
    }
    
    func getCat(){
        var parentCat = categoryViewModel.getCategory(id: mainCategoryId ?? 0)
        
        if let parentCat = parentCat{
            parentCategory = parentCat
        }
    }
    
    var body: some View {

        Text("Edit Category")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        
        HStack {
            Text("Name")
            Spacer()
            TextField("Category Name", text: $name)
                .focused($isFocused)
                .multilineTextAlignment(.trailing)
                .offset(x: animateName ? -1 : 1)
                .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value: animateName)
        }
        .padding()
        
        ColorPicker("Colour", selection: $colour, supportsOpacity: false)
            .padding()
        
        HStack {
            Text("Parent Category")
            Spacer()
            
            VStack(alignment: .trailing) {
                Picker("Category", selection: $parentCategory) {
                    
                    Text("None").tag(Category?.none)
                    Divider()
                    
                    ForEach(categoryViewModel.categories) { cat in
                        if cat.mainCategoryId == nil {
                                                                    
                            HStack {
                                Text(cat.name).font(.title)
                                cat.icon
                            }.tag(Category?.some(cat))
                        }
                    }
                }
                .pickerStyle(.menu)
                .cornerRadius(80.0)
                .background(RoundedRectangle(cornerRadius: 8.0).fill(.quinary))
            }
        }
        .padding()
        
        VStack {
            HStack {
                Text("Icon")
                Spacer()
                Image(systemName: iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding(.vertical)
            }
            
            HStack {
                Image(systemName: "dollarsign.square")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "dollarsign.square"
                    }
                Image(systemName: "macbook")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "macbook"
                    }
                Image(systemName: "football")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "football"
                    }
                Image(systemName: "stethoscope")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "stethoscope"
                    }
            }
            
            HStack {
                Image(systemName: "graduationcap")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "graduationcap"
                    }
                Image(systemName: "airplane.departure")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "airplane.departure"
                    }
                Image(systemName: "iphone")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "iphone"
                    }
                Image(systemName: "list.clipboard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "list.clipboard"
                    }
            }
            
            HStack {
                Image(systemName: "cup.and.saucer")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "cup.and.saucer"
                    }
                Image(systemName: "wineglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "wineglass"
                    }
                Image(systemName: "cart")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "cart"
                    }
                Image(systemName: "gym.bag")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "gym.bag"
                    }
            }
            
            HStack {
                Image(systemName: "basket")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "basket"
                    }
                Image(systemName: "creditcard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "creditcard"
                    }
                Image(systemName: "banknote")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "banknote"
                    }
                Image(systemName: "tram")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(colour)
                    .padding()
                    .onTapGesture() {
                        iconName = "tram"
                    }
            }
            
        }
        .padding()
        
        Spacer()
        
        PlainButton(buttonName: "Done", action: {
            
            let rand = Int.random(in: 0...Int.max)
            
            var newCategory: Category
            
            if let parentCategory = parentCategory {
                
                newCategory = Category(id: rand, name: name, colour: colour, fontAwesomeIcon: .hand_holding_usd, iconName: iconName, mainCategoryId: parentCategory.id)
            } else {
                newCategory = Category(id: rand, name: name, colour: colour, fontAwesomeIcon: .hand_holding_usd, iconName: iconName)
            }
            
            categoryViewModel.editCategory(category: newCategory, id: category.id)
            
            dismiss()
        })
        .onAppear(perform: {
            getCat()
        })
    }
}

#Preview {
    EditCategorySheet(category: CategoryStore.testCategoryStore.categories[1])
}
