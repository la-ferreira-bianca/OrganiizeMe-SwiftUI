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
            Text("Nova tarefa")
                .font(.title2)
            
            HStack {
                Image(systemName: "paperclip")
                    .foregroundColor(.gray)
                
                TextField("Nome", text: $taskName)
                    .font(.headline)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1))
            
            HStack {
                Image(systemName: "list.clipboard")
                    .foregroundColor(.gray)
                
                TextField("Descrição", text: $taskName)
                    .font(.headline)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1))
            
            HStack {
                Text("Categoria:")
                Picker("Categoria", selection: $selectedCategory) {
                    ForEach(categoryData.categories.keys.sorted(), id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.inline)
            }
            .frame(height: 100)
            
            DatePicker("Data inicio:", selection: $initialDate)
                .datePickerStyle(.compact)
            DatePicker("Data final:", selection: $finalDate)
                .padding(.bottom)
            
            Button {
                print("Adicionar tarefa")
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

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask()
            .environmentObject(CategoryData())
    }
}
