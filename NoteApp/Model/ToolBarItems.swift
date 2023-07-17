//
//  ToolBarItems.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 25/06/2023.
//

import SwiftUI

enum toolBarItems: String, CaseIterable {
    case plus = "plus"
    case camera = "Camera"
    case pencil = "Pencil"
    
    
    var index: Int {
        return toolBarItems.allCases.firstIndex(of: self) ?? 0
    }
    var count: Int {
        return toolBarItems.allCases.count
    }
    
}
