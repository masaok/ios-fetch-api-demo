//
//  Api.swift
//  Fetch REST API Demo
//
//  Created by keckadmin on 7/10/23.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    var name: String
    var username: String
    var email: String
}

class Api: ObservableObject {
    @Published var posts = [Post]()
    @Published var users = [User]()
    
    init() {
        fetchPosts()
        fetchUsers()
    }
    
    func fetchPosts() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([Post].self, from: d)
                    DispatchQueue.main.async {
                        self.posts = decodedLists
                    }
                } else {
                    print("No Data")
                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
    
    func fetchUsers() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
                if let d = data {
                    let decodedLists = try JSONDecoder().decode([User].self, from: d)
                    DispatchQueue.main.async {
                        self.users = decodedLists
                    }
                } else {
                    print("No Data")
                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
}
