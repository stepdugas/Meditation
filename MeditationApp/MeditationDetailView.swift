//
//  MeditationDetailView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/5/25.
//

import SwiftUI

struct MeditationDetailView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            // Feather image at the top
            Image("feather")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(12)
                .shadow(radius: 5)

            VStack(alignment: .leading, spacing: 8) {
                Text("MUSIC")
                    .font(.subheadline)
                    .textCase(.uppercase)
                    .opacity(0.7)

                Text("X Minutes of Relaxing Meditation")
                    .font(.title)
            }

            NavigationLink(destination: PlayerView()) {
                Label("Play", systemImage: "play.fill")
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(20)
            }

            Text("Take a moment to slow down and reconnect with your breath. A few quiet seconds can bring lasting calm.")
                .font(.subheadline)
                .opacity(0.8)

            Spacer()
        }
        .padding(20)
        .foregroundColor(.white)
        .background(Color(red: 24/255, green: 23/255, blue: 22/255))
    }
}
