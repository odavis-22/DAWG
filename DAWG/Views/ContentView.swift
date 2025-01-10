//
//  ContentView.swift
//  DAWG
//
//  Created by Owen Davis (student LM) on 12/18/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var viewState: ViewState = .listView

    var body: some View {
        
        ZStack{
            ListView(viewState: $viewState)
           
        }
        
    }
}

#Preview {
    ContentView()
}
