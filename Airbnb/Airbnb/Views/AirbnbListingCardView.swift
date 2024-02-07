//
//  AirbnbListingCardView.swift
//  Airbnb
//
//  Created by Grazi  Berti on 24/01/24.
//

import SwiftUI

struct AirbnbListingCardView: View {
    let model: AirbnbListings
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: model.thumbnail_url ?? ""))
                .frame(width: 100, height: 100)
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .clipped()
            
            VStack {
                Text(model.name ?? "Listings")
                    .font(.title3)
                    .bold()
                
                Text(model.description ?? "Listings")
                    .lineLimit(3)
                    .foregroundColor(Color(.secondaryLabel))
                    .font(.body)
            }
                
        }
    }
}
