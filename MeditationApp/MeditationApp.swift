//
//  MeditationAppApp.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/3/25.
//

import SwiftUI
import UserNotifications

@main
struct MeditationApp: App {
    @AppStorage("hasSeenWelcome") private var hasSeenWelcome = false
    @AppStorage("isDarkMode") private var isDarkMode = false

    init() {
        // Ask for notification permission once when app launches
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                print("Notification error: \(error)")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            if hasSeenWelcome {
                MainTabView()
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            } else {
                MeditationView(hasSeenWelcome: $hasSeenWelcome)
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
    }
}
