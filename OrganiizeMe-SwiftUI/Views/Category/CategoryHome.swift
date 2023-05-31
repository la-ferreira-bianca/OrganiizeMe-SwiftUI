//
//  CategoryHome.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var taskData: TaskData
    @EnvironmentObject var categoryData: CategoryData
    @State private var showingProfile: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categoryData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, categories: categoryData.category)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Categories")
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

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(TaskData())
            .environmentObject(CategoryData())
    }
}
