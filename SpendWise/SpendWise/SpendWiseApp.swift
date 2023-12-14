//
//  SpendWiseApp.swift
//  SpendWise
//
//  Created by Alexander Gosselin on 2023-09-30.
//

import SwiftUI
import UserNotifications

@main
struct SpendWiseApp: App {
    @StateObject var expenseListVM = ExpenseViewModel(store: ExpenseStore.testExpenseStore)
    @StateObject private var taxCalculatorModel = TaxCalculatorViewModel()
    @StateObject private var userModel = UserViewModel()
//    @StateObject private var ThemeManagers = ThemeManagers()
    @State private var categoryListVM = CategoryViewModel(store: CategoryStore())
    @StateObject private var notificationViewModel = NotificationViewModel()
    @StateObject private var appState = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .id(appState.resetFlag) 
                .environmentObject(AppModel())
                .environmentObject(expenseListVM)
                .environment(categoryListVM)
                .environmentObject(taxCalculatorModel)
                .environmentObject(userModel)
                .environmentObject(ThemeManagers())
                .environmentObject(notificationViewModel)
                .onAppear {
                    setAppIcon()
                    // Request notification permissions
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                        if granted {
                            print("Notification authorization granted")
                        } else if let error = error {
                            print("Notification authorization error: \(error.localizedDescription)")
                        } else {
                            print("Notification authorization denied")
                        }
                    }
                }
        }
    }
    
    private func setAppIcon() {
            if let iconSetName = Bundle.main.appIconName,
               let iconSet = AppIconSet(rawValue: iconSetName) {
                UIApplication.shared.setAlternateIconName(iconSet.rawValue)
            }
        }
}
