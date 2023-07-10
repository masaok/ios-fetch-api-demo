//
//  UsersView.swift
//  Fetch REST API Demo
//
//  Created by keckadmin on 7/10/23.
//

import SwiftUI

struct User: Identifiable, Decodable {
    let id: Int
    let name: String
}

struct UsersView: View {
    @State private var users: [User] = []
    @State private var error: String = ""
    
    var body: some View {
        VStack {
            if !error.isEmpty {
                Text(error)
                    .foregroundColor(.red)
            }
            
            List(users) { user in
                Text(user.name)
            }
        }
        .onAppear {
            APIService.shared.getUsers { result in
//                switch result {
//                case .success(let users):
//                    self.users = users
//                case .failure(let error):
//                    self.error = error.localizedDescription
//                }
            }
        }
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
