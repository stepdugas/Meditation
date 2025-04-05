//
//  MeditationListView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/5/25.
//

import SwiftUI

struct MeditationListView: View {
    var body: some View {
        List(sampleMeditations) { meditation in
            NavigationLink(destination: MeditationDetailView(meditation: meditation)) {
                HStack {
                    Image(meditation.imageName)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .cornerRadius(8)

                    VStack(alignment: .leading) {
                        Text(meditation.title)
                            .font(.headline)
                        Text(meditation.duration)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Meditations")
    }
}
