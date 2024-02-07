//
//  DownloadWithEscapingBootcamp.swift
//  SwiftUI_Advanced_Learning
//
//  Created by Grazi  Berti on 07/02/24.
//

/// https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
/// https://jsonplaceholder.typicode.com/
/// https://app.quicktype.io/

import SwiftUI

struct PostModel: Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class DownloadWithEscapingViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPost()
    }
    
    func getPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/2") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data.")
                return
            }
            
            guard error == nil else {
                print("Error: \(String(describing: error))")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Invalid response")
                return
                
            }
            
            guard response.statusCode >= 200 && response.statusCode < 300 else {
                print("Status code shoul be 2xx, but is \(response.statusCode)")
                return
            }
            
            print("SUCCESSFULLY DOWNLOADED DATA!")
            print(data)
            
            let jsonString = String(data: data, encoding: .utf8)
            print(jsonString)
            
            guard let newPost = try? JSONDecoder().decode(PostModel.self, from: data) else { return }
            DispatchQueue.main.async { [weak self] in
                self?.posts.append(newPost)
            }
            
        }.resume()
    }
}

struct DownloadWithEscapingBootcamp: View {
    @StateObject var viewModel = DownloadWithEscapingViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    
                    Text(post.body)
                        .foregroundStyle(Color.gray)
                }
                
            }
        }
    }
}

#Preview {
    DownloadWithEscapingBootcamp()
}
