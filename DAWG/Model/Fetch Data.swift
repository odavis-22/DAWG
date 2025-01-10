//
//  FetchData.swift
//  DAWG
//
//  Created by Marcus Lord (student LM) on 12/18/24.
//

import Foundation

class FetchData: ObservableObject {
    @Published var response: DogAPIResponse = DogAPIResponse(message: [:], status: "")

    // Asynchronous function to fetch data from the Dog API
    func getData() async {
        let urlString = "https://dog.ceo/api/breeds/list/all"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(DogAPIResponse.self, from: data)
            
            // Update the response on the main thread
            DispatchQueue.main.async {
                self.response = decodedResponse
            }
            
            // Debugging output
            print("Decoded breeds: \(self.response.message)")

        } catch {
            print("Error fetching or decoding data: \(error)")
        }
    }
}

struct DogAPIResponse: Codable {
    var message: [String: [String]]  // Dictionary of breeds and their subbreeds
    var status: String
}
