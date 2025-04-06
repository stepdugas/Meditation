//
//  MeditationStartFlowView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/6/25.
//


import SwiftUI

struct MeditationStartFlowView: View {
    let meditation: Meditation
    
    // Track whether the user has selected an intention
    @State private var didSetIntention = false

    var body: some View {
        if didSetIntention {
            // Once the user sets an intention, go to PlayerView
            PlayerView(meditation: meditation)
        } else {
            // Show IntentionView first
            IntentionView(didSetIntention: $didSetIntention)
        }
    }
}
