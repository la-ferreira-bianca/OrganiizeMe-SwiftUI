//
//  LoadFromFile.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 30/05/23.
//

import Foundation
import Combine

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
