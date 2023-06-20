//
//  Task.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import Foundation

struct Task: Hashable, Codable, Identifiable {
    let name: String
    let category: Category
    let id: Int
    var isFavorite: Bool
    let description: String
    let imageName: String
    let hasDeadline: Bool
    let finalDate: String
    
    struct Category: Codable, Hashable {
        let name: String
        let id: Int
        let description: String
        let iconName: String
    }
}
