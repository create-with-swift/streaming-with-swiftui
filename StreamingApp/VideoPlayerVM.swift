//
//  VideoPlayerVM.swift
//  StreamingApp
//
//  Created by Moritz Philip Recke on 26.10.21 for createwithswift.com.
//

import Foundation
import AVKit

final class VideoPlayerVM: AVPlayer {
    
    @Published var player: AVPlayer
    @Published var playerItem: Video
    @Published var selectedQuality: String
    @Published var isReadyToPlay: Bool = false
    @Published var isPlaying: Bool = false {
        willSet {
            if newValue {
                try? AVAudioSession.sharedInstance().setActive(true)
            }
        }
    }
    
    init(item: Video, quality: String){
        
        playerItem = item
        selectedQuality = quality
        player = AVPlayer(url: item.streams[item.streams.firstIndex(where: { $0.resolution == quality })!].streamURL)
        super.init()
        setObservers()
    }
    
    private var observers: [NSKeyValueObservation] = []
    private var canDetectPlaybackBufferEmpty = false
    
    private func setObservers() {
        let emptyObserver = player.currentItem!.observe(\.isPlaybackBufferEmpty) {
            [weak self] (object, observedChange) in
            // show a progress bar
            if self?.canDetectPlaybackBufferEmpty == true {
                print("can detect if the bugger is empty")
            }
        }
        
        let keepUpObserver = player.currentItem!.observe(\.isPlaybackLikelyToKeepUp) {
            [weak self] (object, observedChange) in
            // hide progress bar and keep going
            if self?.canDetectPlaybackBufferEmpty == false {
                self?.canDetectPlaybackBufferEmpty.toggle()
                print("can detect was toggled")
            }
            if object.isPlaybackLikelyToKeepUp == false {
                print("playback is not Likely To KeepUp, should lower resolution")
            }
            
        }
        
        self.observers = [emptyObserver, keepUpObserver]
    }
    
    private var playerContext = 0
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?) {
        guard context == &playerContext else { // give super to handle own cases
            super.observeValue(forKeyPath: keyPath,
                               of: object,
                               change: change,
                               context: context)
            return
        }
        if self.player.timeControlStatus == .playing {
            self.isPlaying = true
        }
        else {
            self.isPlaying = false
        }
        if self.player.status == AVPlayer.Status.readyToPlay {
            self.isReadyToPlay = true
        }
        else {
            self.isReadyToPlay = false
        }
    }

    
}
