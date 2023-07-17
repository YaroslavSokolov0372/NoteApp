//
//  NoteViewModel.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 25/06/2023.
//

import Foundation


class noteViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var activeTool: toolBarItems = .plus
    
    @Published var shouldBold: Bool = true
}
