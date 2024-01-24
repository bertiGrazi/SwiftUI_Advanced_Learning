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
            Text("Loading")
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
