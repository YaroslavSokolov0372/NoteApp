//
//  Lufga.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 25/06/2023.
//

import Foundation
import SwiftUI


enum Lufga: String {
    case extraLight = "ExtraLight"
    case light = "Light"
    case bold = "Bold"
    case extraBold = "ExtraBold"
    case semiBold = "SemiBold"
    case medium = "Medium"
    case regular = "Regular"
    case thin = "Thin"
}

extension View {
    func lufga(_ size: CGFloat, _ font: Lufga) -> some View  {
        self
            .font(.custom("Lufga-\(font.rawValue)", size: size))
    }
}

