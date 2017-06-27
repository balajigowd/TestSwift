//
//  ProfileViewModel.swift
//  MVVM_SAMPLE
//
//  Created by Balaji Goud  on 3/29/17.
//  Copyright © 2017 RBT. All rights reserved.
//

import Foundation

class ProfileViewModel {
    
    let profile: Profile
    
    // MARK - Initialization
    
    init(withProfile profile: Profile) {
        self.profile = profile
    }
    
    func timeForProfile() -> String {
        return stringFromTimeInterval(profile.duration)
    }
    
    private func stringFromTimeInterval(timeInterval: Double) -> String {
        let timeInterval = Int(timeInterval)
        
        let hours = (timeInterval / 3600)
        let seconds = (timeInterval % 60)
        let minutes = ((timeInterval / 60) % 60)
        
        if hours  > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
}
