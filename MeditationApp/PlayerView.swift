//
//  PlayerView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/5/25.
//

import SwiftUI

struct PlayerView: View {
    let meditation: Meditation
    @State private var value: Double = 0.0

    var body: some View {
        ZStack {
            // Background image
            Image(meditation.imageName)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                // Top Bar: Dismiss Button
                HStack {
                    Button(action: {
                        // Dismiss action
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 50)

                // Title
                Text(meditation.title)
                    .font(.title2)
                    .foregroundColor(.blue)
                    .padding(.top, 20)

                Spacer()

                // Time Slider + Labels
                VStack(spacing: 5) {
                    Slider(value: $value, in: 0...60)
                        .accentColor(.white)

                    HStack {
                        Text("0:00")
                        Spacer()
                        Text("1:00")
                    }
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
                }
                .padding(.horizontal, 52)

                // Playback Controls
                HStack(spacing: 30) {
                    PlaybackControlButton(systemName: "repeat") {}
                    PlaybackControlButton(systemName: "gobackward.10") {}
                    PlaybackControlButton(systemName: "play.fill") {}
                    PlaybackControlButton(systemName: "goforward.10") {}
                    PlaybackControlButton(systemName: "stop.fill") {}
                }
                .padding(.vertical, 30)

            }
            .foregroundColor(.white)
        }
    }
}
