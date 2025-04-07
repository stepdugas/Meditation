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

    @AppStorage("favoriteMeditationIDs") private var favoriteMeditationIDs = ""

    private var isFavorite: Bool {
        favoriteMeditationIDs.components(separatedBy: ",").contains(meditation.id)
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

    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%d:%02d", minutes, seconds)
    }

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
                        audioManager.stopAudio()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 50)

                // Title + Favorite Button
                VStack(spacing: 8) {
                    Text(meditation.title)
                        .font(.title2)
                        .foregroundColor(.blue)

                    Button(action: toggleFavorite) {
                        Image(systemName: isFavorite ? "star.fill" : "star")
                            .foregroundColor(isFavorite ? .yellow : .gray)
                            .font(.title2)
                    }
                }
                .padding(.top, 20)

                Spacer()

                // Slider
                VStack(spacing: 5) {
                    Slider(value: Binding(
                        get: { audioManager.currentTime },
                        set: { newValue in
                            audioManager.setCurrentTime(newValue)
                        }
                    ), in: 0...audioManager.duration)
                    .accentColor(.white)

                    HStack {
                        Text(formatTime(audioManager.currentTime))
                        Spacer()
                        Text(formatTime(audioManager.duration))
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
