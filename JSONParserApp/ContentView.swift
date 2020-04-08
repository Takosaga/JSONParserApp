//
//  ContentView.swift
//  JSONParserApp
//
//  Created by Gonzalo Gamez on 4/8/20.
//  Copyright © 2020 Gamez. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var users: [User] = []
    
    var body: some View {
        List(users) { user in
            VStack(alignment: .leading){
                Text("Name: \(user.name)")
                    .font(.headline)
                
                Text("Company: \(user.company)")
                    .font(.subheadline)
                
                Text("Age: \(user.age)")
                    .font(.subheadline)
            }
        }
        .onAppear {
            Api().getUsers { (users) in
                self.users = users
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
