//
//  AddTask.swift
//  OrganiizeMe-SwiftUI
//
//  Created by Bianca Ferreira on 15/06/23.
//

import SwiftUI

struct AddTask: View {
    @EnvironmentObject var categoryData: CategoryData
    
    @State var taskName: String = ""
    @State var taskDescription: String = ""
    
    //todo: change to category
    var categories = ["Tarefa", "Lembrete", "ToDo"]
    @State var selectedCategory = "Tarefa"
    @State var initialDate: Date = .now
    @State var finalDate: Date = .now
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Adicionar nova tarefa")
            TextField("Nome da Task", text: $taskName)
            TextField("Descrição", text: $taskDescription)
            VStack {
                Text("Selecionar Categoria")
                Picker("Categoria", selection: $selectedCategory) {
                    ForEach(categoryData.categories.keys.sorted(), id: \.self) {
                        Text($0)
                    }
                }
            }
            
            DatePicker("Data inicio", selection: $initialDate)
            DatePicker("Data final", selection: $finalDate)
            
            Button {
                print("Adicionar tarefa")
            } label: {
                Text("Adicionar")
            }

        }
        .padding(.leading)
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask()
            .environmentObject(CategoryData())
    }
}
