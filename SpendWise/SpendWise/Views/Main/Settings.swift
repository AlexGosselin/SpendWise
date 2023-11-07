//
//  Settings.swift
//  SpendWise
//
//  Created by ayomide olopha on 07/11/2023.
//

import SwiftUI

struct SettingsView: View {
    @State var isPinned = false
    @State var isDeleted = false
    @State var showBudgetting = false
    @State var showStatusBar = true
    
    @EnvironmentObject var model: AppModel
    @Environment(\.presentationMode) var presentationMode
    @Namespace var namespace
    @AppStorage("isLogged") var isLogged = false
    @AppStorage("isLiteMode") var isLiteMode = true
    @State var address: Address = Address(id: 1, country: "Canada")
    
    var body: some View {
        ZStack {
            
            NavigationView {
                List {
                    Section {
                        profile
                    }
                    
                    Section {
                        NavigationLink {} label: {
                            Label("Settings", systemImage: "gear")
                        }
                        
                        Label("Budgeting", systemImage: "creditcard")
                            .onTapGesture {
                                model.showBudgetting = true
                            }
                            .sheet(isPresented: $model.showBudgetting) {
                                BudgettingView(namespace: namespace)
                            }
                        
                        NavigationLink(destination: MenuView(), label: {
                            Label("Help", systemImage: "questionmark.circle")
                        })
                    }
                    .listRowSeparator(.automatic)
                    
                    Section {
                        Toggle(isOn: $isLiteMode) {
                            Label("Lite Mode", systemImage: isLiteMode ? "tortoise" : "hare")
                        }
                    }
                    
                    linksSection
                    
                    Button {} label: {
                            Text("Delete user data")
                                .frame(maxWidth: .infinity)
                        }
                        .tint(.red)
                        .overlay(
                            NavigationLink(destination: DeleteUserDataView(), label: { EmptyView()})
                        )
                    
                }
                .listStyle(.insetGrouped)
                .navigationTitle("Settings")
            }
        }
    }
    
    var linksSection: some View {
        Section {
            if !isDeleted {
                Link(destination: URL(string: "https://fanshaweonline.ca")!) {
                    HStack {
                        Label("Website", systemImage: "house")
                            .tint(.primary)
                        Spacer()
                        Image(systemName: "link")
                            .tint(.secondary)
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        withAnimation {
                            isPinned.toggle()
                        }
                    } label: {
                        if isPinned {
                            Label("Unpin", systemImage: "pin.slash")
                        } else {
                            Label("Pin", systemImage: "pin")
                        }
                    }
                    .tint(isPinned ? .gray : .yellow)
                }
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button {
                        withAnimation {
                            isDeleted.toggle()
                        }
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                    .tint(.red)
                }
            }
        }
        .listRowSeparator(.automatic)
    }
    
    var profile: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3), .red)
                .font(.system(size: 32))
                .padding()
                .background(Circle().fill(.ultraThinMaterial))
                .background(AnimatedBlobView().frame(width: 400, height: 414).offset(x: 200, y: 0).scaleEffect(0.5))
                .background(HexagonUIView().offset(x: -50, y: -100))
            Text("Femi Oyebayo")
                .font(.title.weight(.semibold))
            Text(address.country)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(AppModel())
    }
}
