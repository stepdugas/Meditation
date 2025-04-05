//
//  PlayerView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/5/25.
//

import SwiftUI
import AVFoundation

struct PlayerView: View {
    let meditation: Meditation
    @State private var value: Double = 0.0
    @StateObject private var audioManager = AudioManager()

    var body: some View {
        ZStack {
            Image(meditation.imageName)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                // Top bar
                HStack {
                    Button(action: {
                        // Dismiss
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

                // Slider
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

                // Controls
                HStack(spacing: 30) {
                    PlaybackControlButton(systemName: "repeat") {}
                    PlaybackControlButton(systemName: "gobackward.10") {}
                    PlaybackControlButton(systemName: "play.fill") {
                        audioManager.playAudio(named: meditation.audioFileName)
                    }
                    PlaybackControlButton(systemName: "stop.fill") {
                        audioManager.stopAudio()
                    }
                    PlaybackControlButton(systemName: "goforward.10") {}
                }
                .padding(.vertical, 30)
            }
            .foregroundColor(.white)
        }
    }
}
