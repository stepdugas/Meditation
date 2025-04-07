//
//  SettingsView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/6/25.
//

import SwiftUI
import UserNotifications

struct SettingsView: View {
    @AppStorage("showIntentionScreen") private var showIntentionScreen = true
    @AppStorage("selectedIntention") private var selectedIntention = ""
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("favoriteMeditationIDs") private var favoriteMeditationIDs = ""
    @AppStorage("dailyReminderTime") private var storedReminderTime: Double = Date().timeIntervalSince1970

    @State private var showTimePicker = false
    @State private var reminderTime: Date

    init() {
        _reminderTime = State(initialValue: Date(timeIntervalSince1970: UserDefaults.standard.double(forKey: "dailyReminderTime")))
    }

    var body: some View {
        NavigationStack {
            Form {
                // 🧘 Intention Options
                Section(header: Text("Intention Settings")) {
                    Toggle("Show Intention Screen", isOn: $showIntentionScreen)

                    Button("Reset My Intention") {
                        selectedIntention = ""
                    }
                    .foregroundColor(.red)
                }

                // 🌙 Appearance
                Section(header: Text("Appearance")) {
                    Toggle("Dark Mode", isOn: $isDarkMode)
                }

                // ⏰ Reminders
                Section(header: Text("Reminders")) {
                    Button("Set Daily Reminder") {
                        showTimePicker.toggle()
                    }

                    if showTimePicker {
                        DatePicker("Reminder Time", selection: $reminderTime, displayedComponents: .hourAndMinute)
                            .datePickerStyle(.wheel)
                            .labelsHidden()

                        Button("Save Reminder Time") {
                            storedReminderTime = reminderTime.timeIntervalSince1970
                            scheduleDailyNotification(at: reminderTime)
                            showTimePicker = false
                        }
                    }
                }

                // 💖 Favorites
                Section(header: Text("Favorites")) {
                    Button("Reset All Favorites") {
                        favoriteMeditationIDs = ""
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("Settings")
        }
    }

    func scheduleDailyNotification(at time: Date) {
        let center = UNUserNotificationCenter.current()

        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                let content = UNMutableNotificationContent()
                content.title = "Time to Meditate"
                content.body = "Take a moment to breathe and be present."
                content.sound = .default

                var dateComponents = Calendar.current.dateComponents([.hour, .minute], from: time)
                dateComponents.second = 0

                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

                let request = UNNotificationRequest(identifier: "dailyMeditationReminder", content: content, trigger: trigger)

                center.add(request)
            } else {
                print("Notification permission denied or error: \(String(describing: error))")
            }
        }
    }
}
