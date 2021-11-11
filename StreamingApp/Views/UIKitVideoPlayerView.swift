//
//  UIKitVideoPlayerView.swift
//  StreamingApp
//
//  Created by Marco Falanga on 11/11/21.
//

import SwiftUI
import AVKit

struct UIKitVideoPlayerView: View {
    @StateObject private var videoPlayerVM = VideoPlayerViewModel.default
    
    var body: some View {
        UIVideoPlayer(player: videoPlayerVM.player)
            .onAppear {
                setAudioSessionCategory(to: .playback)
                videoPlayerVM.player.play()
            }
            .onDisappear {
                videoPlayerVM.player.pause()
                setAudioSessionCategory(to: .ambient)
            }
    }
    
    func setAudioSessionCategory(to value: AVAudioSession.Category) {
        let audioSession = AVAudioSession.sharedInstance()
             do {
                try audioSession.setCategory(value)
             } catch {
                 print("Setting category to AVAudioSessionCategoryPlayback failed.")
             }
    }
}

struct UIKitVideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        UIKitVideoPlayerView()
    }
}

struct UIVideoPlayer: UIViewControllerRepresentable {
    
    let player: AVPlayer
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let vc = AVPlayerViewController()
        vc.player = player
        vc.canStartPictureInPictureAutomaticallyFromInline = true
        return vc
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        uiViewController.player = player
    }
}
