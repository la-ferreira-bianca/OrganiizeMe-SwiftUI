//
//  TaskDetail.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct TaskDetail: View {
    //MARK: - @Variables
    @EnvironmentObject var modelData: ModelData
    
    //MARK: - Variables
    var padding = EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
    var task: Task
    var taskIndex: Int {
        modelData.tasks.firstIndex(where: { $0.id == task.id })!
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(task.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.tasks[taskIndex].isFavorite)
                }
                
                Spacer()
                
                HStack {
                    Text(task.category.rawValue)
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
        TaskDetail(task: ModelData().tasks[2]).environmentObject(ModelData())
    }
}
