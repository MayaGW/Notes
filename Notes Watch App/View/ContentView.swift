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
    func delete(offsets: IndexSet){
        withAnimation{
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    
    func save(){
    
        do{
           //1. Covet the note array to data using JSON ENCoder
            let data = try? JSONEncoder().encode(notes)
            //2. Create a new url to save the filr using the getDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            //3. write the data to the given URL
            try data?.write(to: url)
        }catch{
          print("Saving data has failed")
        }
    }
    func load(){
        DispatchQueue.main.async {
            do{
            //1.get notes urlPAth
                let url = getDocumentDirectory().appendingPathComponent("notes")
            //2.create a new property for the data
                let data = try Data(contentsOf: url)
                //3.decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            }catch{
                print("cannot load any data ")
            }
        }
    }
    func getDocumentDirectory() -> URL{
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
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
                
                
                if notes.count >= 1 {
                    List{
                        ForEach(0..<notes.count, id: \.self){ i in
                            HStack{
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(1)
                                    .padding(.leading,5)
                            }//Hstack
                        }//LOOP
                        .onDelete(perform: delete)
                    }
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }//END OF LIST
              
            }//VSTACK
            .navigationTitle("Notes")
            .onAppear(perform: {
                load()
            })
        }
         
    }
}
//MARK: - PREVIEWS
#Preview {
    ContentView()
}
