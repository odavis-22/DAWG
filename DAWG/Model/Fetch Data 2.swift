//
//  FetchData2.swift
//  DAWG
//
//  Created by Marcus Lord (student LM) on 12/18/24.
//

import Foundation

class FetchData2: ObservableObject {
    @Published var images: [String] = []  // List to hold image URLs

    // Asynchronous function to fetch images for a specific breed or subbreed
    func getImages(breed: String, subbreed: String? = nil) async {
        let urlString: String
        if let subbreed = subbreed {
            urlString = "https://dog.ceo/api/breed/\(breed)/\(subbreed)/images"
        } else {
            urlString = "https://dog.ceo/api/breed/\(breed)/images"
        }

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(DogImageResponse.self, from: data)
            DispatchQueue.main.async {
                self.images = decodedResponse.message
            }
        } catch {
            print("Error fetching or decoding images: \(error)")
        }
    }
}

struct DogImageResponse: Codable {
    var message: [String]  // Array of image URLs
    var status: String
}
