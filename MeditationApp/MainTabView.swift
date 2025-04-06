//
//  MainTabView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/6/25.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            // 🏠 Home Tab
            MeditationView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            // 🧘 Meditations Tab (inside NavigationStack for navigation links)
            NavigationStack {
                MeditationListView()
            }
            .tabItem {
                Label("Meditations", systemImage: "apple.meditate")
            }

            // ⭐️ Favorites 
            Text("Favorites View Coming Soon")
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }

            // ⚙️ Settings/Profile
            Text("Settings View Coming Soon")
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}
