//
//  VideoPlayerView.swift
//  VideoPlayerView
//
//  Created by Moritz Philip Recke on 19.02.21 for createwithswift.com.
//

import SwiftUI
import AVKit

struct BufferVideoPlayerView: View {
    
    private var videoPlayer = VideoPlayerVM(item: Video(name: "Promo Video", streams: [
        Stream(resolution: "360p", streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-360p.m3u8")!),
        Stream(resolution: "540p", streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-540p.m3u8")!),
        Stream(resolution: "720p", streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-720p.m3u8")!),
        Stream(resolution: "1080p", streamURL: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-1080p.m3u8")!)
        ]), quality: "540p")
 
    
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
            BufferVideoPlayerView()
        }
    }
}
