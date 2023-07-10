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

struct UserView: View {
    @ObservedObject var api = Api()
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            List(api.users) { post in
                HStack {
                    Text("\(post.id)")
                    Text(post.name)
                }
            }
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
