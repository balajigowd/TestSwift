//
//  ProfileModel.swift
//  MVVM_SAMPLE
//
//  Created by Balaji Goud  on 3/29/17.
//  Copyright © 2017 RBT. All rights reserved.
//

import Foundation

class Profile {
    var name = "Profile"
    var segments = [Segment]()
    var duration: NSTimeInterval = 450.0
    
    init() {
        // Create Main Segment
        let segment = Segment(type: .Main)
        
        // Add Segment to Profile
        self.segments.append(segment)
    }
    
}

enum SegmentType {
    case Main
    case WarmUp
    case CoolDown
}

class Segment {
    var enabled: Bool
    var type: SegmentType
    var sounds = [Sound]()
    var duration: Double = 300
    
    init(type: SegmentType) {
        self.type = type
        self.enabled = true
    }
    
    func soundOfType(type: SoundType) -> Sound? {
        var result: Sound? = nil
        
        for sound in sounds {
            if sound.type == type {
                result = sound
            }
        }
        return result
    }
}

enum SoundType {
    case Repeat
    case Begin
    case End
}

class Sound {
    var enabled: Bool
    var type: SoundType
    var name: String = ""
    var iterations: Int = 0
    var timeInterval: Double = 300
    
    // MARK - Initialization
    
    init(type: SoundType) {
        self.type = type
        self.enabled = true
    }
    
}