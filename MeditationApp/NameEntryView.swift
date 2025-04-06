//
//  NameEntryView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/6/25.
//

import SwiftUI

struct NameEntryView: View {
    @AppStorage("userName") private var userName: String = ""
    @Environment(\.dismiss) private var dismiss
    @State private var tempName: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome!")
                .font(.largeTitle)
                .bold()
            Text("What should we call you?")
                .font(.headline)

            TextField("Enter your name", text: $tempName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button("Continue") {
                userName = tempName
                dismiss()
            }
            .disabled(tempName.trimmingCharacters(in: .whitespaces).isEmpty)
        }
        .padding()
    }
}
