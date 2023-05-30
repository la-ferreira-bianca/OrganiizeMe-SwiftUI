//
//  TaskList.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct TaskList: View {
    @EnvironmentObject var modelData: TaskData
    //TODO: Change to see what is going to be if favority or other thing
    @State private var showFavorityOnly = false
    
    var filtredTasks: [Task] {
        modelData.tasks.filter { task in
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
            .navigationTitle("Tarefas")
        }
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList().environmentObject(TaskData())
    }
}
