//
//  ManifestVideoPlayerView.swift
//  StreamingApp
//
//  Created by Moritz Philip Recke on 09.11.21.
//

import SwiftUI
import AVKit

struct ManifestVideoPlayerView: View {
    private let player = AVPlayer(url: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-trailer.m3u8")!)
        
    var body: some View {
        VideoPlayer(player: player)
            .navigationTitle("HLS manifest")
            .onAppear {
                player.play()
            }
            .onDisappear {
                player.pause()
            }
    }
}

struct ManifestVideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        ManifestVideoPlayerView()
    }
}
