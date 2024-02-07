//
//  APIService.swift
//  Airbnb
//
//  Created by Grazi  Berti on 24/01/24.
//

import Foundation

final class APIService {
    init() {}
    
    struct Constants {
        static let apiUrl = URL(string: "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=100&refine=city%3A%22New%20York%22&refine=room_type%3A%22Entire%20home%2Fapt%22")
    }
    
    func getListing(completion: @escaping(Result<[AirbnbListings], Error>) -> Void) {
        guard let url = Constants.apiUrl else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) {data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? NSError(domain: "YourDomain", code: 0, userInfo: nil)))
                return
            }
            do {
                let response = try JSONDecoder().decode(AirbnbListingsResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                let json = try? JSONSerialization.jsonObject(with: data)
                print(String(describing: json))
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
