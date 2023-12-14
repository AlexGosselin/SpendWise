//
//  NotificationSheet.swift
//  SpendWise
//
//  Created by ayomide olopha on 13/12/2023.
//

import SwiftUI

struct NotificationSheet: View {
    @EnvironmentObject var notificationViewModel: NotificationViewModel
    @State private var selectedDate = Date()
    
    static func formatTime(_ date: Date) -> String {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            formatter.dateStyle = .none
            return formatter.string(from: date)
        }

    var body: some View {
        NavigationView {
            VStack {
                Toggle("Enable Notifications", isOn: $notificationViewModel.isNotificationEnabled)
                    .padding()

                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: [.hourAndMinute]
                )
                .datePickerStyle(WheelDatePickerStyle()) // You can change the style as per your preference
                .padding()

                Spacer()

                // Save settings and dismiss the sheet
                Button("Save") {
                    let selectedInterval = selectedDate.timeIntervalSinceNow
                    notificationViewModel.setIsNotificationEnabled(notificationViewModel.isNotificationEnabled)
                    notificationViewModel.setNotificationInterval(selectedInterval)
                    notificationViewModel.saveSettings()

                    // Dismiss the sheet
                    notificationViewModel.isSheetPresented = false
                }
                .padding()
                
                // Display the initial notification time
                if let initialTime = notificationViewModel.initialNotificationTime {
                    Text("Initial Notification Time: \(Self.formatTime(initialTime))")
                        .foregroundColor(.secondary)
                        .padding()
                }

                Spacer()
            }
            .navigationTitle("Notification Settings")
        }
    }
}


