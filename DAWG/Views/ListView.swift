//
//  ListView.swift
//  DAWG
//
//  Created by Marcus Lord (student LM) on 12/18/24.
//

import SwiftUI

struct ListView: View {
    @Binding var viewState: ViewState
    @StateObject var data = FetchData()  // Use @StateObject to observe FetchData class
    
    @State private var breeds: [String] = []  // List to hold breed names

    var body: some View {
        NavigationView {
            
            VStack {
                // Show a loading indicator if data is not fetched yet
                if breeds.isEmpty {
                    Text("Loading breeds...")
                        .font(.headline)
                        .padding()
                } else {
                    ScrollView {
                        ForEach(breeds, id: \.self) { breed in
                            NavigationLink(
                                destination: SubbreedListView(breed: breed, subbreeds: data.response.message[breed] ?? [])
                            ) {
                                Text(breed.capitalized)
                                    .font(.title)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.black)
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .padding()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Dog Breeds")
            .onAppear {
                // Fetch data and update breeds
                Task {
                    await data.getData()
                    breeds = Array(data.response.message.keys).sorted()  // Populate and sort breed list after fetching
                }
            }
        }
    }
}

struct SubbreedListView: View {
    var breed: String
    var subbreeds: [String]

    var body: some View {
        VStack {
            if subbreeds.isEmpty {
                // If there are no subbreeds, go directly to DogView
                DogView(breed: breed, subbreed: nil)
            } else {
                // Show a list of subbreeds
                ScrollView {
                    ForEach(subbreeds, id: \.self) { subbreed in
                        NavigationLink(destination: DogView(breed: breed, subbreed: subbreed)) {
                            Text(subbreed.capitalized)
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
        .navigationBarTitle("\(breed.capitalized) Subbreeds", displayMode: .inline)
    }
}



