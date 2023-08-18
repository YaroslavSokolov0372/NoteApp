//
//  ViewExtensions.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 22/06/2023.
//

import Foundation
import SwiftUI
import CoreData

extension View {
    func hAlignment(_ alignment: Alignment, _ maxHeight: CGFloat) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: maxHeight, alignment: alignment)
    }
    func vAlignment(_ alignment: Alignment, _ maxHeight: CGFloat) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
}


extension NSManagedObjectContext: ObservableObject {
    
}
