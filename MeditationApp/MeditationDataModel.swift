//
//  MeditationDataModel.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/5/25.
//

import Foundation

enum MeditationCategory: String, CaseIterable, Identifiable {
    case sleep = "Sleep"
    case morning = "Morning"
    case stressRelief = "Stress Relief"
    case prayer = "Prayer"

    var id: String { self.rawValue }
}

struct Meditation: Identifiable, Equatable {
    let id: String
    let title: String
    let duration: String
    let description: String
    let imageName: String
    let audioFileName: String
    let category: MeditationCategory
}

let sampleMeditations = [
    Meditation(
        id: "relax1min",
        title: "1 Minute Relaxing Meditation",
        duration: "1:00",
        description: "Take a moment to slow down and reconnect with your breath.",
        imageName: "feather",
        audioFileName: "relaxing1min",
        category: .stressRelief
    ),
    Meditation(
        id: "calmMorning",
        title: "Calm Morning",
        duration: "5:00",
        description: "Start your day with peace and clarity.",
        imageName: "morningBeach",
        audioFileName: "calmMorning",
        category: .morning
    )

]
