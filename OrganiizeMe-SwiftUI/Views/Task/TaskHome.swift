//
//  TaskHome.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 16/06/23.
//

import SwiftUI

struct TaskHome: View {
    @EnvironmentObject var taskData: TaskData
    @State private var showingNewCateogory: Bool = false
    @State private var showFavorityOnly = false
    
    var filtredTasks: [Task] {
        taskData.tasks.filter { task in
            (!showFavorityOnly || task.isFavorite)
            
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavorityOnly) {
                    Text("Mostrar apenas Favoritos")
                }
                ForEach(filtredTasks) { task in
                    NavigationLink {
                        TaskDetail(task: task)
                    } label: {
                        TaskRow(task: task)
                    }
                }
            }
            .padding(.leading)
            .listStyle(.inset)
            .navigationTitle("Tarefas")
            .toolbar {
                Button {
                    showingNewCateogory.toggle()
                } label: {
                    Label("NewCategory", systemImage: "plus.square.on.square")
                }
            }
        }
        .sheet(isPresented: $showingNewCateogory) {
            AddTask()
                .environmentObject(CategoryData())
                .presentationDetents([.height(500)])
                .presentationDragIndicator(.visible)
        }
    }
}

struct TaskHome_Previews: PreviewProvider {
    static var previews: some View {
        TaskHome()
            .environmentObject(TaskData())
    }
}
