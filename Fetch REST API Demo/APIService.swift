//
//  File.swift
//  Fetch REST API Demo
//
//  Created by keckadmin on 7/10/23.
//

import Foundation

// APIService.swift
import Alamofire

class APIService {
    
    static let shared = APIService() // Singleton
    
//    let baseURL = "https://api.example.com/"
    let baseURL = "https://jsonplaceholder.typicode.com/"
    
    func getUsers(completion: @escaping (AFResult<Any>) -> Void) {
        let url = "\(baseURL)users"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            completion(response.result)
        }
    }
}
