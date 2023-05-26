//
//  ModelData.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var tasks: [Task] = load("taskData.json")
    @Published var profile = Profile.default
    
    var categories: [String: [Task]] {
        Dictionary(
            grouping: tasks,
            by: { $0.category.rawValue })
    }
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else { fatalError("error not find file main bundle") }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("error not find file main bundle")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("could not parse")
    }
}
