//
//  Example.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 05/07/2023.
//

import SwiftUI

struct Example: View {

        @State var showOne = true
        var body:some View {
            VStack {
                if showOne {
                    HStack {
                        Spacer()
                        Text("One")
                        Spacer()
                    }
                    .background(Color.red)
                    .id("one")
                    .animation(Animation.default)
                    .transition(.slide)
                } else {
                    HStack {
                        Spacer()
                        Text("Two")
                        Spacer()
                    }
                    .background(Color.blue)
                    .id("two")
                    .animation(Animation.default.delay(2))
                    .transition(.slide)
                }
                Button("Toggle") {
                    withAnimation {
                        self.showOne.toggle()
                    }
                }
            }
        }
}

struct Example_Previews: PreviewProvider {
    static var previews: some View {
        Example()
    }
}
