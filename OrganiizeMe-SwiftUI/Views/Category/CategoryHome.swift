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
    @State private var showingNewCateogory: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categoryData.category, id: \.self) { key in
                    CategoryRow(category: key)
                }
                .listRowInsets(EdgeInsets())
            }
            .padding(.leading)
            .listStyle(.inset)
            .navigationTitle("Categories")
            .toolbar {
                Button {
                    showingNewCateogory.toggle()
                } label: {
                    Label("NewCategory", systemImage: "plus.square.on.square")
                }
            }
        }
        .sheet(isPresented: $showingNewCateogory) {
            AddCategory()
                .presentationDetents([.height(300), .medium])
                .presentationDragIndicator(.visible)
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
