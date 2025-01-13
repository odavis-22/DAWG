//
//  ListView.swift
//  DAWG
//
//  Created by Marcus Lord (student LM) on 12/18/24.
//

import SwiftUI

struct ListView: View {
    @Binding var viewState: ViewState
    @StateObject var data = FetchData()
    @State private var breeds: [String] = []

    var body: some View {
        NavigationView {
            
            VStack {
               
                    ScrollView {
                        ForEach(breeds, id: \.self) { breed in
                            NavigationLink(
                                destination: SubbreedListView(breed: breed, subbreeds: data.response.message[breed] ?? [])
                            ) {
                                Text(breed)
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
            .navigationBarTitle("Dog Breeds")
            .onAppear {

                Task {
                    await data.getData()
                    breeds = Array(data.response.message.keys).sorted()  
                }
            }
        }
    }
}


