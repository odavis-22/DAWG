//
//  ContentView.swift
//  DAWG
//
//  Created by Owen Davis (student LM) on 12/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewState: ViewState = .ListView
    @State var articleURL: String = ""

    var body: some View {
        
        if viewState == .ListView {
        ListView()
        } else {
       DogView()
        }
        
        }
}

#Preview {
    ContentView()
}
