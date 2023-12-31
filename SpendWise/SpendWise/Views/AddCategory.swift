//
//  AddCategory.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-10-16.
//

import SwiftUI

struct AddCategory: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Environment(CategoryViewModel.self) private var categoryViewModel: CategoryViewModel

    @State var name: String = ""
    @State var colour: Color = .indigo
    @State var parentCategory: Category?
    @State var iconName: String = "dollarsign.square"
    
    @State var animateName = false
    
    @FocusState var isFocused: Bool
    
    var body: some View {
//        Text("Create Category")
//            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//            .padding()
        
        VStack {
            
            HStack {
                Text("Name")
                Spacer()
                TextField("Category Name", text: $name)
                    .focused($isFocused)
                    .multilineTextAlignment(.trailing)
                    .offset(x: animateName ? -1 : 1)
                    .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value: animateName)
                    .onChange(of: name) {
                        name = String(name.prefix(20))
                    }
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
                    Image(systemName: "wineglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "wineglass"
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
                    Image(systemName: "video")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "video"
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
                    Image(systemName: "bed.double")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "bed.double"
                        }
                    Image(systemName: "list.clipboard")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "list.clipboard"
                        }
                    Image(systemName: "phone")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "phone"
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
                    Image(systemName: "macbook")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "macbook"
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
                    Image(systemName: "music.note")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "music.note"
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
                    Image(systemName: "pawprint")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "pawprint"
                        }
                    Image(systemName: "wifi.router")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "wifi.router"
                        }                    
                    Image(systemName: "gamecontroller")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "gamecontroller"
                        }
                }
                
                HStack {
                    Image(systemName: "gift")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "gift"
                        }
                    Image(systemName: "fuelpump")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "fuelpump"
                        }
                    Image(systemName: "banknote")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "banknote"
                        }
                    Image(systemName: "signature")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "signature"
                        }
                    Image(systemName: "iphone")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(colour)
                        .padding()
                        .onTapGesture() {
                            iconName = "iphone"
                        }
                }
                
            }
//            .padding()
            
            PlainButton(buttonName: "Save", action: {
                let rand = Int.random(in: 0...Int.max)
//                var parentId = 0
                
                if(name != "") {
                    if let parentCategory = parentCategory {
    //                    parentId = parentCategory.id
                        categoryViewModel.addCategory(category: Category(id: rand, name: name, colour: colour, fontAwesomeIcon: .hand_holding_usd, iconName: iconName, mainCategoryId: parentCategory.id))
                    } else {
                        categoryViewModel.addCategory(category: Category(id: rand, name: name, colour: colour, fontAwesomeIcon: .hand_holding_usd, iconName: iconName))
                    }
                    dismiss()
                } else {
                    animateName.toggle()
                }
            })
            
            Spacer()
        }
        .padding()
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                PlainButton(buttonName: "Done", action: {
                    isFocused = false
                })
            }
        }
        .navigationTitle("Create Category")
    }
    
}

#Preview {
    AddCategory()
}
