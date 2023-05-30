//
//  TaskData.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import Foundation

final class TaskData: ObservableObject {
    @Published var tasks: [Task] = load("taskData.json")
    @Published var profile = Profile.default
    
    var categories: [String: [Task]] {
        Dictionary(
            grouping: tasks,
            by: { $0.category.name })
    }
}
