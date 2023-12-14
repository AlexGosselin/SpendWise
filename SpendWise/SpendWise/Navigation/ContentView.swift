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
    
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @StateObject private var appState = AppState()
    
    var body: some View {
        if OnboardingManager.shared.hasLaunched {
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
            
        } else {
            OnboardingView()

            // Update the hasLaunched flag after onboarding
            Button("Continue") {
                OnboardingManager.shared.setHasLaunched()
                appState.toggleReset()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppModel())
    }
}
