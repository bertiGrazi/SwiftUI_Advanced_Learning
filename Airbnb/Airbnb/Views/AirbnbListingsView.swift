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
            if viewModel.listening.isEmpty {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            } else {
                List(viewModel.listening) { listing in
                    NavigationLink(destination: AirbnbDetailsView(model: listing), label: {
                        AirbnbListingCardView(model: listing)
                    })
                }
                .navigationTitle("Airbnb")
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
