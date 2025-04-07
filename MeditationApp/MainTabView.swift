//
//  MainTabView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/6/25.
//
import SwiftUI

enum Tab {
    case home
    case meditations
    case favorites
    case settings
}

struct MainTabView: View {
    @State private var selectedTab: Tab = .home

    var body: some View {
        ZStack {
            Color.clear // 👈 ensures no white background fills the screen

            VStack(spacing: 0) {
                // MARK: - Active Screen
                Group {
                    switch selectedTab {
                    case .home:
                        HomeView()
                    case .meditations:
                        MeditationListView()
                    case .favorites:
                        FavoritesView()
                    case .settings:
                        SettingsView()
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                // MARK: - Custom Tab Bar
                HStack {
                    tabBarItem(icon: "house.fill", tab: .home)
                    tabBarItem(icon: "apple.meditate", tab: .meditations)
                    tabBarItem(icon: "star.fill", tab: .favorites)
                    tabBarItem(icon: "gearshape.fill", tab: .settings)
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 12)
                .background(Color.clear)
                .clipShape(Capsule())
                .padding(.bottom, 10)
                .shadow(radius: 10)
            }
        }
        .ignoresSafeArea(.keyboard) // allow views to move with keyboard
    }

    // MARK: - Reusable Tab Button
    private func tabBarItem(icon: String, tab: Tab) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            Image(systemName: icon)
                .font(.system(size: 22, weight: .semibold))
                .foregroundColor(selectedTab == tab ? .white : .gray)
                .padding()
                .background(
                    Circle()
                        .fill(selectedTab == tab ? Color.accentColor : .clear)
                        .frame(width: 44, height: 44)
                )
        }
    }
}
