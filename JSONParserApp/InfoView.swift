//
//  InfoView.swift
//  JSONParserApp
//
//  Created by Gonzalo Gamez on 4/8/20.
//  Copyright © 2020 Gamez. All rights reserved.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var info: String
    var name: String
    var active: Bool
    var email: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(name)
                .font(.largeTitle)
            
            Text("About:")
                .font(.headline)
            
            Text(info)
                .padding()
            
            Text("Email:")
            .font(.headline)
            
            Text(email)
                .padding()
            
            Text("Is Active:")
                .font(.headline)
            
            Text(String(active))
                .padding()
            
            Button("Back"){
                self.presentationMode.wrappedValue.dismiss()
            }
        .padding()
        }

    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(info: "Hello World", name: "Default", active: false, email: "No Email")
    }
}
