//
//  Home.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

//TODO: - THIS IS NOT HOME, IS CATEGORY VIEW CHANGE LATER
struct Home: View {
    @EnvironmentObject var taskData: TaskData
    @EnvironmentObject var categoryData: CategoryData
    @State private var showingProfile: Bool = false
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Inserir um novo item")
                Text("Items de hoje")
                List {
                    ForEach(categoryData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, categories: categoryData.categories[key]!)
                    }
                }
                List {
                    ForEach((0..<3), id: \.self) { _ in
                        Text("")
                    }
                }
                
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
            ProfileHost()
                .environmentObject(TaskData())
                .environmentObject(CategoryData())
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(TaskData())
    }
}
