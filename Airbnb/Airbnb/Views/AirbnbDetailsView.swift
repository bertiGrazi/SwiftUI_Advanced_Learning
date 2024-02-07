//
//  AirbnbDetailsView.swift
//  Airbnb
//
//  Created by Grazi  Berti on 24/01/24.
//

import SwiftUI

struct AirbnbDetailsView: View {
    let model: AirbnbListings
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { proxy in
                ScrollView(.vertical) {
                    // Picture
                    AsyncImage(url: URL(string: model.xl_picture_url ?? ""))
                        .frame(maxWidth: proxy.frame(in: .global).width)
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                    
                    // Info
                    Text(model.name ?? "")
                        .bold()
                        .padding()
                    
                    if let price = model.price {
                        Text("Nightly price: \(price.formatted(.currency(code: "U$D")))")
                    }
                    Text("Description: \(model.description ?? "")")
                        .padding()
                    Text("Summary: \(model.summary ?? "")")
                        .padding()
                    Text("House Rules: \(model.house_rules ?? "")")
                        .padding()
                    Text("Spaces: \(model.space ?? "")")
                        .padding()
                    
                    // Host Info
                    HStack {
                        AsyncImage(url: URL(string: model.host_picture_url))
                            .frame(width: 75, height: 75)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                        
                        Text(model.host_name)
                            .bold()
                    }.padding()
                    
                    Text("Hosting since: " + model.host_since)
                }
                .frame(maxWidth: proxy.frame(in: .global).width)
            }
        }
        .navigationTitle(model.name ?? "Listing")
    }
}

