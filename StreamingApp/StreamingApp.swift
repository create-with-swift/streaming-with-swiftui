//
//  StreamingApp.swift
//  StreamingApp
//
//  Created by Moritz Philip Recke on 21.10.21 for createwithswift.com.
//

import SwiftUI

@main
struct StreamingApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    NavigationLink("Simple video player") {
                        SimpleVideoPlayerView()
                    }
                    
                    NavigationLink("Observing player's status") {
                        BufferVideoPlayerView()
                    }
                    
                    NavigationLink("HLS manifest") {
                        ManifestVideoPlayerView()
                    }
                }
                .navigationBarTitle("StreamingApp")
            }
        }
    }
}
