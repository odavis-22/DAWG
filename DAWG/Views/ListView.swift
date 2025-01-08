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
    
    
    var body: some View {
        
        for Breed in 1...10 {
            Text(Breed)
        }
        
    }
}       

#Preview {
                ListView(viewState: .constant(.ListView))
            }
