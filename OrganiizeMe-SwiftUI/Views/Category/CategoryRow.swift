//
//  CategoryRow.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var tasks: [Task]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(tasks) { task in
                        NavigationLink {
                            TaskDetail(task: task)
                        } label: {
                            CategoryItem(task: task)
                        }
                    }
                }
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var tasks = TaskData().tasks
    
    static var previews: some View {
        CategoryRow(
            categoryName: tasks[0].category.name,
            tasks: Array(tasks.prefix(4)))
    }
}
