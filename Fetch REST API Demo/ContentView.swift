//
//  ContentView.swift
//  Fetch REST API Demo

// Sending and receiving Codable data with
// URLSession and SwiftUI – Cupcake Corner SwiftUI Tutorial 2/9
// By Paul Hudson
// https://www.youtube.com/watch?v=MBCX1atOvdA

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

struct ContentView: View {
    @State private var results = [Result]()
    
    var body: some View {
        VStack {
            List(results, id: \.trackId) { item in VStack(alignment: .leading) {
                Text(item.trackName).font(.headline)
                Text(item.collectionName)
            }
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        let postsUrl = "https://itunes.apple.com/search?term=taylor+swift&entity=song"
        
        guard let url = URL(string: postsUrl) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                print(decodedResponse)
                results = decodedResponse.results
                print(results)
            
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
