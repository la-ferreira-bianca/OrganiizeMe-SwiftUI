//
//  TaskRow.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct TaskRow: View {
    var task: Task
    
    var body: some View {
        HStack {
            Image(systemName: task.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(task.name)
            Spacer()
            
            if task.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var tasks = TaskData().tasks
    static var previews: some View {
        Group {
            TaskRow(task: tasks[0])
        }.previewLayout(.fixed(width: 300, height: 300))
    }
}
