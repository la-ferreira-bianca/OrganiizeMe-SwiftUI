//
//  CategoryData.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 30/05/23.
//

import Foundation

final class CategoryData: ObservableObject {
    @Published var categories: [Category] = load("categoryData.json")
    
}
