//
//  DownloadWithEscapingBootcamp.swift
//  SwiftUI_Advanced_Learning
//
//  Created by Grazi  Berti on 07/02/24.
//

/// https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
/// https://jsonplaceholder.typicode.com/

import SwiftUI

class DownloadWithEscapingViewModel: ObservableObject {
    
    init() {
        getPost()
    }
    
    func getPost() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1") else { return }
        
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
        }.resume()
    }
}

struct DownloadWithEscapingBootcamp: View {
    @StateObject var vireModel = DownloadWithEscapingViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DownloadWithEscapingBootcamp()
}
