//
//  IntentionView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/6/25.
//

import SwiftUI

struct IntentionView: View {
    @AppStorage("selectedIntention") private var selectedIntention: String = ""
    @Binding var didSetIntention: Bool
    @State private var showCustomInput = false
    @State private var customIntention = ""

    let intentions = [
        "Relax",
        "Clear My Mind",
        "Feel Grateful",
        "Breathe Deeply",
        "Let Go of Stress"
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Set Your Intention")
                    .font(.title)
                    .bold()

                // Predefined intention buttons
                ForEach(intentions, id: \.self) { intention in
                    Button(action: {
                        selectedIntention = intention
                        didSetIntention = true
                    }) {
                        Text(intention)
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.blue, lineWidth: 1)
                            )
                    }
                    .padding(.horizontal)
                }

                // "Write Your Own" button
                Button(action: {
                    showCustomInput.toggle()
                }) {
                    Text("✍️ Write Your Own")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple.opacity(0.1))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.purple, lineWidth: 1)
                        )
                }
                .padding(.horizontal)

                // If user chooses to write their own
                if showCustomInput {
                    TextField("Enter your intention", text: $customIntention)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button("Start Meditation") {
                        if !customIntention.trimmingCharacters(in: .whitespaces).isEmpty {
                            selectedIntention = customIntention
                            didSetIntention = true
                        }
                    }
                    .font(.headline)
                    .padding(.top, 10)
                }

                Spacer()
            }
            .padding(.top, 50)
            .padding(.horizontal)
        }
    }
}
