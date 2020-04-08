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
    @State private var showingInfo = false
    
    var body: some View {
        List(users) { user in
            VStack(alignment: .leading){
                Button("Name: \(user.name)") {
                    self.showingInfo.toggle()
                }
                
                .foregroundColor(Color.blue)
                .cornerRadius(2)
                .sheet(isPresented: self.$showingInfo) {
                    InfoView(info: user.about, name: user.name, active: user.isActive, email: user.email)
                        
                }
                
                    
                
                Text("Age: \(user.age)")
                    .font(.subheadline)
                
                Text("Company: \(user.company)")
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
