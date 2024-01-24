//
//  AirbnbListingsResponse.swift
//  Airbnb
//
//  Created by Grazi  Berti on 24/01/24.
//

import Foundation

struct AirbnbListingsResponse: Codable {
    let total_count: Int
    let results: [AirbnbListings]
}
