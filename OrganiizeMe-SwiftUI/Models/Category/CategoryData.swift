//
//  CategoryData.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 30/05/23.
//

import Foundation

final class CategoryData: ObservableObject {
    @Published var category: [Category] = load("categoryData.json")
    
    var categories: [String: [Category]] {
        Dictionary(
            grouping: category,
            by: { $0.name })
    }
}
