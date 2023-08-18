//
//  NoteSketch.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 17/08/2023.
//

import SwiftUI

struct NoteSketch: View {
    var body: some View {
        HStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .frame(width: 150, height: 40)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.green.opacity(0.5))
        )
    }
}

struct NoteSketch_Previews: PreviewProvider {
    static var previews: some View {
        NoteSketch()
    }
}
