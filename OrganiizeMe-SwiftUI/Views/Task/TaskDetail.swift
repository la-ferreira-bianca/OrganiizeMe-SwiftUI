//
//  TaskDetail.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct TaskDetail: View {
    //MARK: - @Variables
    @EnvironmentObject var taskData: TaskData
    
    //MARK: - Variables
    var padding = EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
    var task: Task
    var taskIndex: Int {
        taskData.tasks.firstIndex(where: { $0.id == task.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(task.name)
                        .font(.title)
                    FavoriteButton(isSet: $taskData.tasks[taskIndex].isFavorite)
                }
                
                Spacer()
                
                HStack {
                    Text(task.category.name)
                    Image(systemName: task.category.iconName)
                }
                
                Divider()
                
                Text("Sobre \(task.name)")
                    .font(.title2)
                
                Spacer()
                
                Text(task.description)
            }
        }.padding(padding)
    }
}

struct TaskDetail_Previews: PreviewProvider {
    static var previews: some View {
        TaskDetail(task: TaskData().tasks[1]).environmentObject(TaskData())
    }
}
