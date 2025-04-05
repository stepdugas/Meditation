//
//  MeditationDataModel.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/5/25.
//

import Foundation

struct Meditation: Identifiable {
    let id = UUID()
    let title: String
    let duration: String
    let description: String
    let imageName: String
    let audioFileName: String
}

let sampleMeditations = [
    Meditation(
        title: "1 Minute Relaxing Meditation",
        duration: "1:00",
        description: "Take a moment to slow down and reconnect with your breath.",
        imageName: "feather",
        audioFileName: "relaxing1min"
    ),
    Meditation(
        title: "Calm Morning",
        duration: "5:00",
        description: "Start your day with peace and clarity.",
        imageName: "morningBeach",
        audioFileName: "calmMorning"
    )
]
