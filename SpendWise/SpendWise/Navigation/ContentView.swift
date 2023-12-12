//
//  ContentView.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-09-30.
//

import SwiftUI
import SwiftUICharts
import SwiftUIFontIcon

struct ContentView: View {
    @Environment(\.modelContext) private var context
    
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        NavigationView {
            ZStack {
                Group {
                    switch selectedTab {
                    case .home:
                        HomeView()
                    case .explore:
                        ExpenseView()
                    case .notifications:
                        HomeView()
                    case .settings:
                        SettingsView()
                    }
                }
                .safeAreaInset(edge: .bottom) {
                    VStack {}.frame(height: 44)
                }
                
                TabBar()
            }
            .dynamicTypeSize(.large ... .xxLarge)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppModel())
    }
}
