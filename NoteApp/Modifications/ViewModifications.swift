//
//  ViewModifications.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 22/06/2023.
//

import Foundation
import SwiftUI

extension View {
    func strokeBackground(padding: CGFloat, cornerRadius: CGFloat) -> some View {
        self
            .padding(15)
            
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: 2)
            }
            .cornerRadius(cornerRadius)
    }
}
