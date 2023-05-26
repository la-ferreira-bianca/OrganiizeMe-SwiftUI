//
//  Task.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import Foundation

struct Task: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var imageName: String
    var isFavorite: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case task = "Tarefas"
        case reminders = "Lembretes"
    }
}
