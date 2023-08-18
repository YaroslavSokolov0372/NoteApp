//
//  OffsetReader.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 17/07/2023.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func `offsetX`(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .frame(maxWidth: .infinity)
            .overlay{
                
                    GeometryReader {
                        let rect = $0.frame(in: .global)
                        
                        Color.clear
                            .preference(key: OffsetKey.self, value: rect)
                            .onPreferenceChange(OffsetKey.self ,perform: completion)
                    
                }
            }
    }
}



struct ScrollViewPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


extension View {
    func onScrollOffsetChanged(action: @escaping (_ offset: CGFloat) -> Void) -> some View {
        self
            .background(
                GeometryReader { proxy in
                    let offsetY = proxy.frame(in: .global).minY
                    Color.clear
                        .preference(key: ScrollViewPreferenceKey.self ,value: offsetY)
                        
                }
            )
            .onPreferenceChange(ScrollViewPreferenceKey.self) { value in
                action(value)
            }
    }
}
