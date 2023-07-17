//
//  Note.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 25/06/2023.
//

import SwiftUI



var notesElement = [any View]()

//var nootesElement = [any View]() as! TextFields
// var xxx: [Any] = []


struct CustomTextField: View /*Hashable*/ {

//    var uid = UUID()

    @State var text: String = ""

    var body: some View {
        TextEditor(text: $text)
            .padding(.vertical)
            .padding(.horizontal, 20)
            
    }
}


extension View {
    var id: UUID {
        UUID()
    }
}
