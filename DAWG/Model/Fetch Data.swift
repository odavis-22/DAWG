//
//  Fetch Data.swift
//  DAWG
//
//  Created by Marcus Lord (student LM) on 12/18/24.
//

import Foundation


struct FetchData{
    
    var response: Response = Response()
    
    mutating func getData() async{
        let URLString = "https://dog.ceo/api/breed/hound/images"

        
        guard let url = URL(string: URLString) else {return}
        
        let (data, _) = try! await URLSession.shared.data(from: url)
        response = try! JSONDecoder().decode(Response.self, from: data)
        
        let dataString = String(data: data, encoding: .utf8)
        print(dataString ?? " ")
    }
}

struct Response: Codable {
    
    
//    var message: [Breed] = []
    
    var images: [Image] = []
}

struct Image: Codable{
    var link: String
}

extension Image: Identifiable {
    var id: String {link ?? ""}
}

//struct Breed: Codable {
//    var breed: String = ""
//    var subbreeds: [String] = []
//}

//extension Breed: Identifiable {
//    var id: String {breed ?? " "}
//}

