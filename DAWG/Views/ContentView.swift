//
//  ContentView.swift
//  DAWG
//
//  Created by Owen Davis (student LM) on 12/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewState: ViewState = .listview

    var body: some View {
        
        if viewState == .listview {
            ListView(viewState: $viewState)
        } else {
       DogView()
        }
        
        }
}

#Preview {
    ContentView()
}
