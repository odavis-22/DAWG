//
//  ViewState.swift
//  DAWG
//
//  Created by Marcus Lord (student LM) on 12/18/24.
//

import Foundation

enum ViewState: Equatable {
    case listView
    case dogView(breed: String, subbreed: String?) 
}
