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
            Image("beach")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                ZStack {
                    
                    Text("Welcome to your meditation app")
                        .font(.title)
                        .foregroundColor(.black)
                        .offset(x: 1, y: 1)
                    
                    Text("Welcome to your meditation")
                        .font(.title)
                        .foregroundColor(.white)
                }
                .padding(.bottom,100)
                
            }
        }
    }
}

#Preview {
    MeditationView()
}
