//
//  DogView.swift
//  DAWG
//
//  Created by Marcus Lord (student LM) on 12/18/24.
//

import SwiftUI

struct DogView: View {
    var breed: String
    var subbreed: String?
    
    var body: some View {
        VStack {
            Text("Breed: \(breed)")
                .font(.largeTitle)
                .padding()
            
            if let subbreed = subbreed {
                Text("Subbreed: \(subbreed)")
                    .font(.title)
                    .padding()
            } else {
                Text("No subbreed selected")
                    .font(.subheadline)
                    .padding()
            }
        }
        .navigationBarTitle("\(breed) \(subbreed != nil ? "- \(subbreed!)" : "")")
    }
}



