//
//  SimpleVideoPlayerView.swift
//  StreamingApp
//
//  Created by Moritz Philip Recke on 09.11.21.
//

import SwiftUI
import AVKit

struct SimpleVideoPlayerView: View {
    private let player = AVPlayer(url: URL(string: "https://d142uv38695ylm.cloudfront.net/videos/promo/allesneu.land-promo-trailer-360p.m3u8")!)
    
    var body: some View {
        VideoPlayer(player: player) {
            VStack {
                Text("Overlay")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
        }
        .navigationTitle("Simple video player")
        .onAppear() {
            player.play()
        }
        .onDisappear {
            player.pause()
        }
    }
}

struct SimpleVideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleVideoPlayerView()
    }
}
