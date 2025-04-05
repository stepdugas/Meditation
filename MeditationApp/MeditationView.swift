//
//  MeditationView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/4/25.
//

import SwiftUI

struct MeditationView: View {
    var body: some View {
        ZStack {
            Image("rock-image")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Text("Welcome to your meditation")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                
            }
        }
    }
}

#Preview {
    MeditationView()
}
