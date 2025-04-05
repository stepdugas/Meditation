//
//  PlayerView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/5/25.
//

import SwiftUI

struct PlayerView: View {
    @State private var value: Double = 0.0
    var body: some View {
        ZStack {
            Image("feather")
                .resizable()
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width)
                .ignoresSafeArea()
        }
        VStack {
            Text("Now Playing")
                .font(.title)
                .padding()

            Spacer()

            // Add meditation timer, controls, etc. here
            Button {
                
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.white)
            }

            Text("🧘‍♀️ Enjoy your session")
                .opacity(0.6)
            VStack(spacing: 5) {
                Slider(value: $value, in: 0...60)
                    .accentColor(.white)
                
                HStack {
                    Text("00:00")
                    Spacer()
                    Text("01:00")
                }
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .foregroundColor(.white)
    }
}
