//
//  EditUserSheet.swift
//  SpendWise
//
//  Created by oyebayo oluwafemi on 2023-12-03.
//

import SwiftUI

struct EditUserSheet: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var themeManager: ThemeManagers
    @EnvironmentObject var userModel: UserViewModel
    var user: User
    let addressList: [Address] = AddressStore.addressStoreData.address
    
    @State private var selectedAddress: Address
    @State private var name: String
    
    @State private var newUser: User = User()
    
    @State private var animateName = false
    @FocusState private var nameFocused: Bool
    
    init(user: User) {
        self.user = user
        self._selectedAddress = State(initialValue: user.address)
        self._name = State(initialValue: user.name)
    }
    
    
    var body: some View {
        Spacer()
        Text("Edit User Profile")
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        Spacer()
        HStack {
            Text("Name*")
            Spacer()
            TextField("Name", text: $name)
                .focused($nameFocused)
                .multilineTextAlignment(.trailing)
                .offset(x: animateName ? -1 : 1)
                .animation(.interpolatingSpring(stiffness: 3000, damping: 10, initialVelocity: 100), value: animateName)
                .onChange(of: name) {
                    name = String(name.prefix(20))
                }
        }
        .padding()
        
        HStack {
            Text("Country")
            Spacer()
            Picker("Address", selection: $selectedAddress) {
                ForEach(addressList, id: \.id) { address in
                    Text(address.country).tag(address)
                    }
                }
            .pickerStyle(.menu)
        
        }
        .padding()
        
        Spacer()
        
        FullButton(buttonName: "Save", action: {
            var valid = true
            
            if(name == "") {
                animateName.toggle()
                valid = false
            }
            
            if(!valid) {
                return
            }
            
            newUser.name = name
            newUser.address = selectedAddress
            
            userModel.editUser(newUser: newUser)
            
            dismiss()
            dismiss()
        })
        
        Spacer()
    }
}

#Preview {
    EditUserSheet(user: User())
        .environmentObject(UserViewModel())
}
