//
//  SubBreedView.swift
//  DAWG
//
//  Created by Marcus Lord (student LM) on 1/13/25.
//

import SwiftUI

struct SubbreedListView: View {
    var breed: String
    var subbreeds: [String]

    var body: some View {
        VStack {
            if subbreeds.isEmpty {
                DogView(breed: breed, subbreed: nil)
            } else {
                ScrollView {
                    ForEach(subbreeds, id: \.self) { subbreed in
                        NavigationLink(destination: DogView(breed: breed, subbreed: subbreed)) {
                            Text(subbreed)
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .padding()
                        }
                    }
                }
            }
        }
        .navigationBarTitle("\(breed) Subbreeds", displayMode: .inline)
    }
}




