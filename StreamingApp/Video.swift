//
//  Video.swift
//  StreamingApp
//
//  Created by Moritz Philip Recke on 21.10.21 for createwithswift.com.
//

import Foundation
import Network

struct Video {
    let name: String
    let streams: [Stream]
}

struct Stream {
    let resolution: Resolution
    let streamURL: URL
}

enum Resolution: Int, Identifiable, Comparable, CaseIterable {
    case p360 = 0
    case p540
    case p720
    case p1080
    
    var id: Int { rawValue }
    
    var displayValue: String {
        switch self {
        case .p360: return "360p"
        case .p540: return "540p"
        case .p720: return "720p"
        case .p1080: return "1080p"
        }
    }
    
    static func ==(lhs: Resolution, rhs: Resolution) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
    
    static func <(lhs: Resolution, rhs: Resolution) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
