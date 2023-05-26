//
//  CategoryItem.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct CategoryItem: View {
    var task: Task
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: task.imageName)
                .resizable()
                .frame(width: 155, height: 155)
                .contrast(5)
            
            Text(task.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 20)
        Spacer()
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(task: ModelData().tasks[0])
    }
}
