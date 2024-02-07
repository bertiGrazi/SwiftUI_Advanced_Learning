//
//  AirbnbListeningViewViewModel.swift
//  Airbnb
//
//  Created by Grazi  Berti on 24/01/24.
//

import Foundation

final class AirbnbListeningViewViewModel: ObservableObject {
    private let service = APIService()
    
    @Published var listening: [AirbnbListings] = []
    
    public func fetchListings() {
        service.getListing { [weak self] result in
            DispatchQueue.main.async { 
                switch result {
                case .success(let models):
                    self?.listening = models
                case .failure:
                    break
                }
            }
        }
    }
}
