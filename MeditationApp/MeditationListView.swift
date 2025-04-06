//
//  MeditationListView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/5/25.
//

import SwiftUI

struct MeditationListView: View {
    @State private var selectedCategory: MeditationCategory = .morning

    // Filtered list based on selected category
    var filteredMeditations: [Meditation] {
        sampleMeditations.filter { $0.category == selectedCategory }
    }

    var body: some View {
        VStack {
            // Category Picker
            Picker("Category", selection: $selectedCategory) {
                ForEach(MeditationCategory.allCases) { category in
                    Text(category.rawValue).tag(category)
                }
            }
            .pickerStyle(.segmented)
            .padding()

            // List of filtered meditations
            List(filteredMeditations) { meditation in
                
                NavigationLink(destination: MeditationStartFlowView(meditation: meditation)) {
                    
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
        }
        .navigationTitle("Meditations")
    }
}
