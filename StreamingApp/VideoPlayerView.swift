//
//  VideoPlayerView.swift
//  VideoPlayerView
//
//  Created by Moritz Philip Recke on 19.02.21 for createwithswift.com.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    private var videoPlayer = VideoPlayerVM(item: Video(name: "Promo Video", streams: [
        Stream(resolution: "360p", streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-360p.m3u8")!),
        Stream(resolution: "540p", streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-540p.m3u8")!),
        Stream(resolution: "720p", streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-720p.m3u8")!),
        Stream(resolution: "1080p", streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-1080p.m3u8")!)
        ]), quality: "540p")
    

    private var networkMonitor = NetworkMonitor()
    
    init() {
        
//        if player.currentItem?.isPlaybackBufferEmpty == true {
//            print("playback buffer is empty")
//        } else {
//            print("buffer has data")
//        }
//        if player.currentItem?.isPlaybackLikelyToKeepUp == true  {
//            print("Playback is Likely To Keep Up")
//        } else {
//            print("playback is unlikely to keep up, switched to lowest stream")
//            self.selectedQuality = "360p"
//            player = AVPlayer(url: video.streams[video.streams.firstIndex(where: { $0.resolution == selectedQuality })!].streamURL)
//        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            VideoPlayer(player: videoPlayer.player){
                Text("\(videoPlayer.playerItem.name) at \(videoPlayer.selectedQuality)")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }.frame(height: 220)
                .onAppear() {
                    videoPlayer.player.play()
                }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VideoPlayerView()
        }
    }
}
