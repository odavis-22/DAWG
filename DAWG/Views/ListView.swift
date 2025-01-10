//
//  ListView.swift
//  DAWG
//
//  Created by Marcus Lord (student LM) on 12/18/24.
//

import SwiftUI

struct ListView: View {
    @Binding var viewState: ViewState
    @State var data: FetchData = FetchData()
    
    @State private var breeds: [String] = []  // List to hold breed names
    
    var body: some View {
        NavigationView {
            VStack {
                // Show a loading indicator if data is not fetched yet
                if breeds.isEmpty {
                    Text("Loading breeds...")
                        .font(.headline)
                        .padding()
                }
                
                ScrollView {
                    ForEach(breeds, id: \.self) { breed in
                        VStack(alignment: .leading) {
                            // Breed Button
                            NavigationLink(destination: DogView(breed: breed, subbreed: nil)) {
                                Text(breed)
                                    .font(.title)
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                            // Subbreed Buttons (if they exist)
                            if let subbreeds = data.response.message.breeds[breed], !subbreeds.isEmpty {
                                ForEach(subbreeds, id: \.self) { subbreed in
                                    NavigationLink(destination: DogView(breed: breed, subbreed: subbreed)) {
                                        Text("\(breed) - \(subbreed)")
                                            .font(.subheadline)
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .background(Color.green)
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
                .navigationBarTitle("Dog Breeds")
                .onAppear {
                    // Fetch data and update breeds
                    Task {
                        await data.getData()
                        breeds = Array(data.response.message.breeds.keys)  // Populate breed list after fetching
                        print("Breeds: \(breeds)")  // Debugging output
                    }
                }
            }
        }
    }
}
