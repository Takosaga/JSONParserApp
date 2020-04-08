//
//  Data.swift
//  JSONParserApp
//
//  Created by Gonzalo Gamez on 4/8/20.
//  Copyright © 2020 Gamez. All rights reserved.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    let id: String
    var name: String
    var age: Int
    var company: String
    var about: String
    var isActive: Bool
    var email: String
    var friends: [Friends]
    
}

struct Friends: Codable {
    var name: String
}


class Api {
    func getUsers(completion: @escaping ([User]) -> ()) {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let users = try! JSONDecoder().decode([User].self, from: data!)
            DispatchQueue.main.async {
                completion(users)
            }
        }
    .resume()
    }
}
