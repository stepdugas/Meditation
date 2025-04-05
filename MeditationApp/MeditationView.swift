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
            // Background image
            Image("bible-coffeecup")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Meditation icon
                Image(systemName: "apple.meditate")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .shadow(radius: 5)

                // Outlined text – Line 1
                ZStack {
                    Text("Welcome to your")
                        .font(.title)
                        .foregroundColor(.black)
                        .offset(x: -1, y: -1)
                    Text("Welcome to your")
                        .font(.title)
                        .foregroundColor(.white)
                }

                // Outlined text – Line 2
                ZStack {
                    Text("meditation app")
                        .font(.title)
                        .foregroundColor(.black)
                        .offset(x: -1, y: -1)
                    Text("meditation app")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    MeditationView()
}
