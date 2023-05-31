//
//  CategoryRow.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var categories: [Category]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(categories) { category in
                        NavigationLink {
//                            TaskDetail(task: task)
                        } label: {
                            CategoryItem(category: category)
                        }
                    }
                }
            }
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var category = CategoryData().category
    
    static var previews: some View {
        CategoryRow(
            categoryName: category[0].name,
            categories: Array(category.prefix(4)))
    }
}
