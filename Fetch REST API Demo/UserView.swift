//
//  UserView.swift
//  Fetch REST API Demo
//
//  Created by keckadmin on 7/10/23.
//

// Credit: ChatGPT

import SwiftUI
import Combine

struct Post: Codable, Identifiable {
    var id: Int
    var userId: Int
    var title: String
    var body: String
}

class Api: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
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
                print("Fetch Error: \(error)")
            }
        }.resume()
    }
}


struct UserView: View {
    @ObservedObject var api = Api()
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            List(api.posts) { post in
                HStack {
                    Text("\(post.id)")
                    Text(post.title)
                }
            }
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
