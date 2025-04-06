//
//  SettingsView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/6/25.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("showIntentionScreen") private var showIntentionScreen = true
    @AppStorage("selectedIntention") private var selectedIntention = ""
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("favoriteMeditationIDs") private var favoriteMeditationIDs = ""

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
                        // ⏰ We’ll add this in a future session
                        print("Reminder tapped")
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
}
