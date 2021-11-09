//
//  Video.swift
//  StreamingApp
//
//  Created by Moritz Philip Recke on 21.10.21.
//

import Foundation
import Network

struct Video {
    let name: String
    let streams: [Stream]
}

struct Stream {
    let resolution: String
    let streamURL: URL
}


class NetworkMonitor {
    
    let monitor = NWPathMonitor()
    
    init() {
            monitor.pathUpdateHandler = { path in
                if path.status == .satisfied {
                    print("network is connected")
                    // Put your logic code
                    if path.usesInterfaceType(.wifi) {
                        print("It's WiFi!")
                    } else if path.usesInterfaceType(.cellular) {
                        print("It's Cellular!")
                    }
                    if path.isConstrained {
                        print("It's Constrained!")
                    }
         
       
                }else {
                   print("No connection.")
                   // Put your logic code
               }
            }
            let queue = DispatchQueue.global(qos: .background)
            monitor.start(queue: queue)
        }
    
}
