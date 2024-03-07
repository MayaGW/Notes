//
//  Settings.swift
//  Notes Watch App
//
//  Created by Maya Ghamloush on 07/03/2024.
//

import SwiftUI

struct Settings: View {
    //MARK: - PROPERTIES
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    //MARK: - Functions
    func update(){
        lineCount = Int(value)
    }
    //MARK: - Body
    var body: some View {
        VStack(spacing:8){
            //HEADER
            HeaderView(title: "Settings")
            //ACTUAL LINE COUNT
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            //SLIDER
            Slider(value:Binding(get: {
                self.value
            }, set: {(newValue) in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .tint(.accentColor)
                 
                
            
            
        }//VStack
    }
}

#Preview {
    Settings()
}
