//
//  VideoPlayerView.swift
//  VideoPlayerView
//
//  Created by Moritz Philip Recke on 19.02.21 for createwithswift.com.
//

import SwiftUI
import AVKit

struct BufferVideoPlayerView: View {
    
    @StateObject private var videoPlayerVM = VideoPlayerViewModel.default
 
    @State private var showResolutions = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Button("Change resolution") {
                    withAnimation {
                        showResolutions.toggle()
                    }
                }
                .font(Font.body.bold())
                
                VideoPlayer(player: videoPlayerVM.player) {
                    Text(videoPlayerVM.namePlusResolution)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                        .padding(8)
                }
                .onAppear() {
                    videoPlayerVM.player.play()
                }
                .onDisappear {
                    videoPlayerVM.player.pause()
                }
            }
            .padding()
            
            if showResolutions {
                VStack(spacing: 20) {
                    Spacer()
                    ForEach(Resolution.allCases) { resolution in
                        Button(resolution.displayValue, action: {
                            withAnimation {
                                videoPlayerVM.selectedResolution = resolution
                                showResolutions.toggle()
                            }
                        })
                    }
                    
                    Button(action: {
                        withAnimation {
                            showResolutions.toggle()
                        }
                    }, label: {
                        Image(systemName: "xmark.circle")
                            .imageScale(.large)
                    })
                        .padding(.top)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
                .transition(.move(edge: .bottom))
            }
        }
        .navigationBarTitle("Observing player's status")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BufferVideoPlayerView()
    }
}
