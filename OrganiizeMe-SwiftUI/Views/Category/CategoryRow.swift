//
//  CategoryRow.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct CategoryRow: View {
    var category: Category
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image(systemName: category.iconName)
                Text(category.name)
                    .font(.headline)
            }
            .frame(height: 50)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var category = CategoryData().category
    
    static var previews: some View {
        CategoryRow(category: category[0])
    }
}
