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
        
        NavigationView{
            
            List (data.response.images){ link in
                    
                NavigationLink{
                    DogView()
                }label: {
                    Text(link)
                }
                
            }
        }
       
        
    }
}       

#Preview {
                ListView(viewState: .constant(.listview))
            }
