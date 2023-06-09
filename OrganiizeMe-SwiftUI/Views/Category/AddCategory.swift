//
//  AddCategory.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 16/06/23.
//

import SwiftUI

enum CategoryIcons: String, CaseIterable {
    case book = "book"
    case idea = "lightbulb"
    case write = "pencil.tip"

    var image: Image {
        Image(systemName: rawValue)
    }
}

struct AddCategory: View {
    @EnvironmentObject var categoryData: CategoryData
    
    @State var categoryName: String = ""
    @State var categoryDescription: String = ""
    @State var selectedIcon: CategoryIcons = .idea
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Nova Categoria")
                .font(.title2)
                .padding(.top)
            
            HStack {
                Image(systemName: "mug")
                    .foregroundColor(.gray)
                
                TextField("Nome", text: $categoryName)
                    .font(.headline)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1))
            
            HStack {
                Image(systemName: "ellipsis.rectangle")
                    .foregroundColor(.gray)
                
                TextField("Descrição", text: $categoryDescription)
                    .font(.headline)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1))
            
            HStack {
                Text("Icone: ")
                    .font(.title3)
                    .foregroundColor(.gray)
                Picker("Categoria", selection: $selectedIcon) {
                    ForEach(CategoryIcons.allCases, id: \.self) {
                        $0.image
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Divider()
            
            Button {
                print("Adicionar category")
            } label: {
                Text("Criar")
                    .frame(width: 200, height: 15)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue.opacity(0.8))
                    .cornerRadius(10)
            }
            .padding(.bottom)
            
        }
        .padding(.all)
    }
}

struct AddCategory_Previews: PreviewProvider {
    static var previews: some View {
        AddCategory()
            .environmentObject(CategoryData())
    }
}
