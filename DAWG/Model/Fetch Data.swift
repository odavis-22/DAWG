//
//  Fetch Data.swift
//  DAWG
//
//  Created by Marcus Lord (student LM) on 12/18/24.
//
import Foundation

struct FetchData {
    var response: Response = Response(status: "success", message: Response.Message(breeds: [:]))
    
    mutating func getData() async {
        let URLString = "https://dog.ceo/api/breeds/list/all"
        
        guard let url = URL(string: URLString) else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
            response = decodedResponse  // Update the response object with the decoded data
            
            // Debugging output: check the decoded breeds
            print("Decoded breeds: \(response.message.breeds)")
            
        } catch {
            print("Error fetching or decoding data: \(error)")
        }
    }

}

struct Response: Codable {
    var status: String
    var message: Message
    
    struct Message: Codable {
        // `breeds` is now a dictionary with breed names as keys and subbreeds as values (arrays)
        var breeds: [String: [String]]
        
        // Initializer to handle the breeds dictionary
        init(breeds: [String: [String]] = [:]) {
            self.breeds = breeds
        }
    }
}
