//
//  MeditationDetailView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/5/25.
//

import SwiftUI

struct MeditationDetailView: View {
    let meditation: Meditation

    @AppStorage("favoriteMeditationIDs") private var favoriteMeditationIDs = ""

    private var isFavorite: Bool {
        favoriteMeditationIDs.components(separatedBy: ",").contains(meditation.id)
    }

    var body: some View {
        VStack(spacing: 20) {
            Image(meditation.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)

            Text(meditation.title)
                .font(.title)

            // ⭐️ Favorite Button
            Button(action: toggleFavorite) {
                Label(isFavorite ? "Remove from Favorites" : "Add to Favorites",
                      systemImage: isFavorite ? "star.fill" : "star")
                    .font(.subheadline)
                    .foregroundColor(isFavorite ? .yellow : .gray)
            }

            NavigationLink(destination: PlayerView(meditation: meditation)) {
                Label("Play", systemImage: "play.fill")
                    .font(.headline)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(10)
            }

            Text(meditation.description)
                .font(.subheadline)
                .opacity(0.8)

            Spacer()
        }
        .padding()
    }

    private func toggleFavorite() {
        var ids = Set(favoriteMeditationIDs.components(separatedBy: ",").filter { !$0.isEmpty })

        if ids.contains(meditation.id) {
            ids.remove(meditation.id)
        } else {
            ids.insert(meditation.id)
        }

        favoriteMeditationIDs = ids.joined(separator: ",")
    }
}
