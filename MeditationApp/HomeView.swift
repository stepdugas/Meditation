//
//  HomeView.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/6/25.
//
import SwiftUI

struct HomeView: View {
    @AppStorage("userName") private var userName: String = ""
    @AppStorage("lastMeditationDate") private var lastMeditationDate: String = ""
    @AppStorage("streakCount") private var streakCount: Int = 0

    var body: some View {
        ZStack {
            // 🌄 Background image
            Image("bible-coffeecup")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 24) {
                // 🕊️ App Title
                Text("Sacred Pause")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.7), radius: 2, x: 0, y: 1)
                    .padding(.top, 60)

                // 👋 Personalized Greeting
                greetingSection

                // 🔥 Streak Tracker
                streakTrackerSection

                // 🧠 Mood-Based Suggestions (commented out for now)
                /*
                howAreYouFeelingSection
                */
            }
            .padding(.horizontal)
            //.frame(maxWidth: .infinity, alignment: .leading)
        }
        .onAppear {
            updateStreak()
        }
        .sheet(isPresented: .constant(userName.isEmpty)) {
            NameEntryView()
        }
    }

    // MARK: - UI Sections

    private var greetingSection: some View {
        let name = userName.capitalized
        let greeting = getGreetingForTimeOfDay()

        return Text("\(greeting), \(name) 👋")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .shadow(color: .black.opacity(0.5), radius: 1, x: 0, y: 1)
    }

    private var streakTrackerSection: some View {
        HStack {
            Image(systemName: "flame.fill")
                .foregroundColor(.orange)
            Text("You’ve meditated \(streakCount) day\(streakCount == 1 ? "" : "s") in a row")
                .foregroundColor(.white)
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
        .shadow(radius: 4)
    }

    // MARK: - Optional Mood Buttons (Commented Out)
    /*
    private var howAreYouFeelingSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("How are you feeling?")
                .font(.headline)
                .foregroundColor(.white)

            HStack(spacing: 16) {
                feelingButton(title: "Calm", emoji: "😌")
                feelingButton(title: "Focused", emoji: "🎯")
                feelingButton(title: "Tired", emoji: "😴")
            }
        }
    }

    private func feelingButton(title: String, emoji: String) -> some View {
        Button(action: {
            // TODO: Trigger meditation suggestions
        }) {
            VStack {
                Text(emoji)
                    .font(.largeTitle)
                Text(title)
                    .font(.caption)
            }
            .padding()
            .background(Color.white.opacity(0.8))
            .cornerRadius(12)
            .shadow(radius: 2)
        }
    }
    */

    // MARK: - Logic

    private func getGreetingForTimeOfDay() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12: return "Good morning"
        case 12..<17: return "Good afternoon"
        default: return "Good evening"
        }
    }

    private func updateStreak() {
        let today = Calendar.current.startOfDay(for: Date())
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let lastDate = formatter.date(from: lastMeditationDate) ?? Date.distantPast
        let lastSaved = Calendar.current.startOfDay(for: lastDate)

        let daysBetween = Calendar.current.dateComponents([.day], from: lastSaved, to: today).day ?? 0

        switch daysBetween {
        case 0:
            break // already meditated today
        case 1:
            streakCount += 1
            lastMeditationDate = formatter.string(from: today)
        default:
            streakCount = 1
            lastMeditationDate = formatter.string(from: today)
        }
    }
}
