//
//  Profile.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import Foundation

struct Profile {
    var userName: String
    var prefersNotifications: Bool = true
    var seasonPhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(userName: "b_ianca")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { rawValue }
    }
}
