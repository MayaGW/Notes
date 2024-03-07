//
//  CreditView.swift
//  Notes Watch App
//
//  Created by Maya Ghamloush on 06/03/2024.
//

import SwiftUI

struct CreditView: View {
    
    //MARK: - PROPERTIES
    @State private var randomNumber: Int = Int.random(in: 1 ..< 4)
    private var randomImage: String {
        return "developer-no\(randomNumber)"
    }
    var body: some View {
        VStack(alignment:.center, spacing:5){
            //profile
        
            Image(randomImage)
                .resizable()
                .scaledToFit()
         
                .layoutPriority(1)
            //header
                  HeaderView(title: "Credits")
            //content
            Text("Maya Ghamloush")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developper")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
                
            
        }//Vstack
    }
}

#Preview {
    CreditView()
}
