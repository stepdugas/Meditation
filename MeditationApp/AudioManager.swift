//
//  AudioManager.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/5/25.
//

import AVFoundation

class AudioManager: ObservableObject {
    @Published var currentTime: TimeInterval = 0.0

    var audioPlayer: AVAudioPlayer?
    var timer: Timer?

    var duration: TimeInterval {
        audioPlayer?.duration ?? 0
    }

    func playAudio(named fileName: String, fileExtension: String = "mp3") {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("❌ Audio file \(fileName).\(fileExtension) not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
            startTimer()
        } catch {
            print("❌ Failed to play audio: \(error.localizedDescription)")
        }
    }

    func stopAudio() {
        audioPlayer?.stop()
        stopTimer()
    }

    func pauseAudio() {
        audioPlayer?.pause()
        stopTimer()
    }

    func resumeAudio() {
        audioPlayer?.play()
        startTimer()
    }

    func isPlaying() -> Bool {
        return audioPlayer?.isPlaying ?? false
    }

    private func startTimer() {
        stopTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.currentTime = self.audioPlayer?.currentTime ?? 0
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    // Update time when user scrubs slider
    func setCurrentTime(_ time: TimeInterval) {
        audioPlayer?.currentTime = time
        currentTime = time
    }
}
