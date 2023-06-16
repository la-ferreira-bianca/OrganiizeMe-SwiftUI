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
    @State private var showingAddTask: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button {
                        showingAddTask.toggle()
                    } label: {
                        Text("Adicionar Tarefa")
                    }.sheet(isPresented: $showingAddTask) {
                        showingAddTask = false
                    } content: {
                        AddTask()
                    }


                    Text("Items de hoje")
                }
                
                List {
                    Text("Minhas Categorias")
                    ForEach(categoryData.category, id: \.self) { key in
                        CategoryRow(category: key)
                    }
                    
                    Spacer()
                    
                    Text("Minhas Tarefas")
                    ForEach(taskData.tasks, id: \.self) { key in
                        TaskRow(task: key)
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
        }.onDisappear {
            showingProfile.toggle()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .environmentObject(TaskData())
            .environmentObject(CategoryData())
    }
}
