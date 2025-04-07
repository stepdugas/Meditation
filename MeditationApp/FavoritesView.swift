//
//  FavoritesView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/7/25.
//

import SwiftUI

struct FavoritesView: View {
    @AppStorage("favoriteMeditationIDs") private var favoriteMeditationIDs: String = ""
    
   
   
    let allMeditations: [Meditation] = sampleMeditations

    var favoriteMeditations: [Meditation] {
        let ids = Set(favoriteMeditationIDs.components(separatedBy: ","))
        return allMeditations.filter { ids.contains($0.id) }
    }

    var body: some View {
        NavigationStack {
            List {
                if favoriteMeditations.isEmpty {
                    Text("No favorites yet! ⭐️\nTap the star on a meditation to favorite it.")
                        .multilineTextAlignment(.center)
                        .padding()
                } else {
                    ForEach(favoriteMeditations) { meditation in
                        NavigationLink(destination: MeditationDetailView(meditation: meditation)) {
                            Text(meditation.title)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
