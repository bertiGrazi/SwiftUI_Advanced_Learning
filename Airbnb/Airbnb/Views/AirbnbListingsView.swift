//
//  AirbnbListingsView.swift
//  Airbnb
//
//  Created by Grazi  Berti on 24/01/24.
//

import SwiftUI

struct AirbnbListingsView: View {
    @StateObject var viewModel = AirbnbListeningViewViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.listening) { listing in
                NavigationLink(destination: Text("Hello"), label: {
                    AirbnbListingCardView(model: listing)
                })
                
            }
        }
        .onAppear {
            viewModel.fetchListings()
        }
    }
}

struct AirbnbListingsView_Previews: PreviewProvider {
    static var previews: some View {
        AirbnbListingsView()
    }
}
