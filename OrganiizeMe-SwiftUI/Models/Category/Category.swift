//
//  Category.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 30/05/23.
//

import Foundation
struct Category: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var iconName: String
}
