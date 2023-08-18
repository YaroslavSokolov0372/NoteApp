//
//  SizeReader.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 17/07/2023.
//

import SwiftUI

extension View {
    func saveSize(_ size: Binding<CGSize>) -> some View {
        modifier(SizeCalculator(size: size))
    }
}

struct SizeCalculator: ViewModifier {
    
    @Binding var size: CGSize
    
    func body(content: Content) -> some View {
        content
            .overlay {
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            size = proxy.size
                        }
                }
            }
    }
}



struct SizeReader: PreferenceKey {
    static var defaultValue: CGSize = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}




