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
            
            Text(model.name ?? "Listings")
                .font(.title)
                .bold()
        }
    }
}
