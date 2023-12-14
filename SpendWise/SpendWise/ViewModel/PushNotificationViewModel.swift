//
//  PushNotificationViewModel.swift
//  SpendWise
//
//  Created by ayomide olopha on 13/12/2023.
//

import Foundation
import UserNotifications
import Combine

class NotificationViewModel: ObservableObject {
    
    

    private let notificationIntervalKey = "NotificationInterval"
    private let isNotificationEnabledKey = "IsNotificationEnabled"

    @Published var notificationInterval: TimeInterval {
        didSet {
            UserDefaults.standard.set(notificationInterval, forKey: notificationIntervalKey)
            scheduleDailyNotification()
        }
    }

    @Published var isNotificationEnabled: Bool {
        didSet {
            UserDefaults.standard.set(isNotificationEnabled, forKey: isNotificationEnabledKey)
            if isNotificationEnabled {
                scheduleDailyNotification()
            } else {
                cancelNotification()
            }
        }
    }
    
    @Published var initialNotificationTime: Date?
    
    @Published var isSheetPresented: Bool = false

    private var cancellables: Set<AnyCancellable> = []

    init() {
        self.notificationInterval = UserDefaults.standard.double(forKey: notificationIntervalKey)
        self.isNotificationEnabled = UserDefaults.standard.bool(forKey: isNotificationEnabledKey)
        
        if let savedDate = UserDefaults.standard.object(forKey: "InitialNotificationTime") as? Date {
            self.initialNotificationTime = savedDate
        }

        $notificationInterval
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)

        $isNotificationEnabled
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
        }
    
    // Schedule a daily notification
    private func scheduleDailyNotification() {
        guard isNotificationEnabled, notificationInterval > 0 else {
            cancelNotification()
            return
        }

        let content = UNMutableNotificationContent()
        content.title = "Daily Notification Title"
        content.body = "This is the body of the daily notification."
        content.sound = UNNotificationSound.default

        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.hour, .minute], from: Date())

        var triggerDateComponents = DateComponents()
        triggerDateComponents.hour = dateComponents.hour
        triggerDateComponents.minute = dateComponents.minute

        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: "DailyNotification", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling daily notification: \(error.localizedDescription)")
            } else {
                print("Daily notification scheduled successfully")
            }
        }
    }

    // Cancel the scheduled notification
    private func cancelNotification() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["DailyNotification"])
    }

    func setNotificationInterval(_ interval: TimeInterval) {
        self.notificationInterval = interval
    }

    func setIsNotificationEnabled(_ isEnabled: Bool) {
        self.isNotificationEnabled = isEnabled
    }
    
    func saveSettings() {
        UserDefaults.standard.set(notificationInterval, forKey: notificationIntervalKey)
        UserDefaults.standard.set(isNotificationEnabled, forKey: isNotificationEnabledKey)
    }

}

