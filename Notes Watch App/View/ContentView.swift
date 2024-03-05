//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Maya Ghamloush on 05/03/2024.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    //MARK: - FUNCTIONS
    func save(){
        dump(notes)
    }
    //MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .center, spacing: 6){
                    TextField("Add New Task", text: $text)
                       
                    Button(action: {
                        guard text.isEmpty == false else{return }
                        let note = Note(id: UUID(), text: text)
                        notes.append(note)
                        
                        text = ""
                        save()
                    }, label: {
                        Image(systemName: "plus.circle")
                    })
                    .fixedSize()
                   // .buttonStyle(BorderedButtonStyle(tint: .accentColor))
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.accentColor)
                    .font(.system(size: 42, weight: .semibold))
                }//hstak
                Spacer()
                Text("\(notes.count)")
            }//VSTACK
            .navigationTitle("Notes")
        }
         
    }
}
//MARK: - PREVIEWS
#Preview {
    ContentView()
}
