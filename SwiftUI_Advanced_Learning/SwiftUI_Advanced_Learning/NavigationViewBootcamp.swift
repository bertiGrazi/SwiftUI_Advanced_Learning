//
//  NavigationViewBootcamp.swift
//  SwiftUI_Advanced_Learning
//
//  Created by Grazi  Berti on 07/02/24.
//

import SwiftUI

struct NavigationViewBootcamp: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
                Text("Hello, World!")
                
                Text("Hello, World!")
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("All Inboxes")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    NavigationViewBootcamp()
}
