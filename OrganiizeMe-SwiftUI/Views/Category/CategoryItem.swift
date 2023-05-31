//
//  CategoryItem.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 26/05/23.
//

import SwiftUI

struct CategoryItem: View {
    var category: Category
    
    var body: some View {
        VStack(alignment: .center) {
            Image(systemName: category.iconName)
                .resizable()
                .frame(width: 50, height: 50)
                .contrast(5)
            
            Text(category.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 20)
        Spacer()
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(category: CategoryData().category[0])
    }
}
