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
    @StateObject var fetchData2 = FetchData2()  // Use FetchData2 to fetch images

    var body: some View {
        VStack {
            if fetchData2.images.isEmpty {
                Text("Loading images...")
                    .font(.headline)
                    .padding()
            } else {
                ScrollView {
                    ForEach(fetchData2.images, id: \.self) { imageUrl in
                        AsyncImage(url: URL(string: imageUrl)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding(.bottom)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
        }
        .navigationBarTitle(subbreed == nil ? breed.capitalized : "\(breed.capitalized) - \(subbreed!.capitalized)", displayMode: .inline)
        .onAppear {
            Task {
                await fetchData2.getImages(breed: breed, subbreed: subbreed)
            }
        }
    }
}
