//
//  AudioManager.swift
//  MeditationApp
//
//  Created by Stephanie Dugas on 4/5/25.
//

import AVFoundation

class AudioManager: ObservableObject {
    var audioPlayer: AVAudioPlayer?

    func playAudio(named fileName: String, fileExtension: String = "mp3") {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("❌ Audio file \(fileName).\(fileExtension) not found.")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("❌ Failed to play audio: \(error.localizedDescription)")
        }
    

    func stopAudio() {
        audioPlayer?.stop()
    }
}
    func pauseAudio() {
        audioPlayer?.pause()
    }

    func resumeAudio() {
        audioPlayer?.play()
    }

    func isPlaying() -> Bool {
        return audioPlayer?.isPlaying ?? false
    }
}
