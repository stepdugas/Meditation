//
//  MeditationAppApp.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/3/25.
//

import SwiftUI

@main
struct MeditationApp: App {
    @AppStorage("hasSeenWelcome") private var hasSeenWelcome = false
    @AppStorage("isDarkMode") private var isDarkMode = false

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
