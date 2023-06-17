//
//  ContentView.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .home
    
    enum Tab {
        case home
        case category
        case tasks
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Home()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(Tab.home)
            
            TaskHome()
                .tabItem {
                    Label("Tarefas", systemImage: "list.bullet")
                }
                .tag(Tab.tasks)
            
            CategoryHome()
                .tabItem {
                    Label("Categorias", systemImage: "star")
                }
                .tag(Tab.category)
        }.toolbarBackground(Color.gray, for: .automatic)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TaskData())
            .environmentObject(CategoryData())
    }
}
