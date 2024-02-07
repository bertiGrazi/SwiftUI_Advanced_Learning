//
//  CodableDecodableEncodable.swift
//  SwiftUI_Advanced_Learning
//
//  Created by Grazi  Berti on 07/02/24.
//

import SwiftUI

// Codable = Decobacle + Encodable

struct CustomerModel: Identifiable, Codable {
    //let id = UUID().uuidString
    let id: String
    let name: String
    let points: Int
    let isPremium: Bool
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case points
//        case isPremium
//    }
    
//    init(id: String, name: String, points: Int, isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(String.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//        self.points = try container.decode(Int.self, forKey: .points)
//        self.isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//    
//    func encode(to encode: Encoder) throws {
//        var container = encode.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(points, forKey: .points)
//        try container.encode(isPremium, forKey: .isPremium)
//    }
}

class CodableViewModel: ObservableObject {
    
    //@Published var customer: CustomerModel? = CustomerModel(id: "1", name: "Grazi", points: 5, isPremium: true)
    
    @Published var customer: CustomerModel? = nil
    
    init() {
        getData()
    }
    
    func getData() {
        guard let data = getJSONData() else { return }
        self.customer = try? JSONDecoder().decode(CustomerModel.self, from: data)
        
        /// 1
        //print("JSON DATA:")
        //print(data) //55 bytes
        
        //let jsonString = String(data: data, encoding: .utf8)
        //print(jsonString) //Optional("{\"name\":\"Joe\",\"isPremium\":true,\"id\":\"12345\",\"points\":5}")
        
        /// 2
        
//        if
//            let localData = try? JSONSerialization.jsonObject(with: data, options: []),
//            let dictionary = localData as? [String: Any] ,
//            let id = dictionary["id"] as? String,
//            let name = dictionary["name"] as? String,
//            let points = dictionary["points"] as? Int,
//            let isPremium = dictionary["isPremium"] as? Bool {
//            
//            let newCustomer = CustomerModel(id: id, name: name, points: points, isPremium: isPremium)
//            customer = newCustomer
//        }
            
        /// 3
//        do {
//            self.customer = try JSONDecoder().decode(CustomerModel.self, from: data)
//        } catch let error {
//            print("Error decoding. \(error)")
//        }
        
    }
    
    func getJSONData() -> Data? {
        let customer = CustomerModel(id: "111", name: "Emily", points: 100, isPremium: false)
        let jsonData = try? JSONEncoder().encode(customer)
        
        // Fake JSON Data
//        let dictionary: [String: Any] = [
//            "id": "12345",
//            "name": "Joe",
//            "points": 5,
//            "isPremium": true
//        ]
        
        // let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
        
        return jsonData
    }
    
}

struct CodableBootcamp: View {
    @StateObject var viewModel = CodableViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let customer = viewModel.customer {
                Text(customer.id)
                
                Text(customer.name)
                
                Text("\(customer.points)")
                
                Text(customer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodableBootcamp()
}
