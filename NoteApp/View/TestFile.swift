//
//  TestFile.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 22/08/2023.
//

import SwiftUI

//struct TestFile: View {
//    var body: some View {
//        NavigationView {
//            List(0..<10) {
//                LinkCard(number: $0 + 1)
//            }
//        }
//    }
//}

//struct LinkCard: View {
//    let number: Int
//    @State private var isActive = false
//    @State private var isBig = false
//
//    var body: some View {
//        RoundedRectangle(cornerRadius: 12).fill(Color.yellow)
//            .frame(height: isBig ? 400 : 100)
//            .overlay(Text("Card \(number)"))
//            .background(NavigationLink(
//                destination: Text("Details \(number)"),
//                isActive: $isActive) {
//                EmptyView()
//            })
//            .onTapGesture {
//                isActive.toggle()    // << activate link !!
//            }
//            .onLongPressGesture {
//                isBig.toggle()       // << alterante action !!
//            }
//    }
//}
//struct TestFile_Previews: PreviewProvider {
//    static var previews: some View {
//        TestFile()
//    }
//}
