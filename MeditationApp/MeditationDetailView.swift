//
//  MeditationDetailView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/5/25.
//

import SwiftUI

struct MeditationDetailView: View {
    let meditation: Meditation

    var body: some View {
        VStack(spacing: 20) {
            Image(meditation.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)

            Text(meditation.title)
                .font(.title)

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
}
