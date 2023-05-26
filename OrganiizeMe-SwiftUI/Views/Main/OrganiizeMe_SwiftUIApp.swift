//
//  OrganiizeMe_SwiftUIApp.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

@main
struct OrganiizeMe_SwiftUIApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ModelData())
        }
    }
}
