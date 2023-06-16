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
        HStack(alignment: .center) {
            Image(systemName: task.imageName)
            
            Text(task.name)
            
            if task.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        .frame(height: 50)
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
