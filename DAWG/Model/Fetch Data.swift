//
//  FetchData.swift
//  DAWG
//
//  Created by Marcus Lord (student LM) on 12/18/24.
//

import Foundation

class FetchData: ObservableObject {
    @Published var response: DogAPIResponse = DogAPIResponse(message: [:], status: "")

    func getData() async {
        let urlString = "https://dog.ceo/api/breeds/list/all"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(DogAPIResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.response = decodedResponse
            }
            

        } catch {
            print("Error\(error)")
        }
    }
}

struct DogAPIResponse: Codable {
    var message: [String: [String]]  
    var status: String
}
