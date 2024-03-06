//
//  DetailView.swift
//  Notes Watch App
//
//  Created by Maya Ghamloush on 06/03/2024.
//

import SwiftUI

 
//MARK: - BODY
struct DetailView: View {
    //MARK: - PROPERTIES
    
    let note: Note
    let count: Int
    let Index: Int
    
    var body: some View {
        VStack(alignment: .center, spacing: 3){
            //HEADER
            HStack{
                Capsule()
                    .frame(height: 1)
                Image(systemName: "note.text")
                Capsule()
                    .frame(height: 1)
            }.foregroundColor(.accentColor)
            //CONTENT
            Spacer()
            ScrollView(.vertical){
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }//Scroll
            //FOOTER
            HStack(alignment:.center){
                Image(systemName: "gear")
                    .imageScale(.large)
                Spacer()
                Text("\(count) / \(Index + 1 )")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
            }//Hstack
            .foregroundColor(.secondary)
            
        }//Vstack
        .padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleData = Note(id: UUID(), text: "Hello World")
        return DetailView(note: sampleData, count: 5, Index: 1)
    }
}
