//
//  NoteViewScetch.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 03/07/2023.
//

import SwiftUI

struct NoteViewScetch: View {
    
    @State var text: String = ""
    
    var body: some View {
        
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    CollecitonView()
                        .padding(.bottom, 50)
                    
                    TextField("Here comes text...", text: $text, axis: .vertical)
                        .submitLabel(.return)
                        .lufga(20, .regular)
                        .padding(20)
                }
            }
            .coordinateSpace(name: "Collections")
            
            .padding(.horizontal)
        }
    }
}
    
    
    @ViewBuilder
    func CollecitonView() -> some View  {
        GeometryReader { proxy in
            let size = proxy.size
            let minY = proxy.frame(in: .named("Collections")).minY
            
            
             
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(notes, id: \.self) { note in
                            HStack {
                                Text(note)
                                    .lufga(15, .light)
                                    .foregroundColor(.white)
                            }
                            
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                
                            )
                            
                        }
                        
                    }
                }
                .offset(y: -minY)
            }
            
        
    }

struct NoteViewScetch_Previews: PreviewProvider {
    static var previews: some View {
        NoteViewScetch()
    }
}


var notes: [String] = ["Hello World", "Named", "Style", "Collection"]
