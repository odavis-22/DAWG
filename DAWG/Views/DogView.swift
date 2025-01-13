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
    @StateObject var fetchData2 = FetchData2()

    var body: some View {
        VStack {
           
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
        .navigationBarTitle(subbreed == nil ? breed : "\(breed) - \(subbreed!)")
        .onAppear {
            Task {
                await fetchData2.getImages(breed: breed, subbreed: subbreed)
            }
        }
    }
}
