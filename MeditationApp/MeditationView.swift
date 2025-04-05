//
//  MeditationView.swift
//  MeditationApp
// 
//  Created by Stephanie Dugas on 4/4/25.
//

import SwiftUI

struct MeditationView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image
                Image("bible-coffeecup")
                    .resizable(capInsets: EdgeInsets(top: -16.0, leading: -15.0, bottom: -15.0, trailing: -15.0), resizingMode: .stretch)
                    .padding(.horizontal)
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Meditation icon
                    Image(systemName: "apple.meditate")
                        .resizable()
                        .padding()
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
                    NavigationLink(destination: MeditationDetailView()) {
                        Text("Start")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 10)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .shadow(radius: 3)
                    }
                }
                .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    MeditationView()
}
