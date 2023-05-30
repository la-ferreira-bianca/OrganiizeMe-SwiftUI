//
//  Home.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var modelData: TaskData
    @State private var showingProfile: Bool = false
    var body: some View {
        NavigationView{
            List {
//                ForEach(defaultCategories.)
            }
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
        }
        .sheet(isPresented: $showingProfile) {
            ProfileHost().environmentObject(TaskData())
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(TaskData())
    }
}
