//
//  NoteScrollView.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 19/08/2023.
//

import SwiftUI

struct NoteScrollView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    let note: Note
    let collection: NoteCollection
    
    
    
    
    @State private var colors: [Color] = [.red, .blue, .purple, .yellow, .black, .indigo, .cyan,
                                          .brown, .mint, .orange]
    
    @State var rows: [[Color]] = []
    
    
    
    var body: some View {
        ScrollView(.vertical) {
            
            VStack(spacing: 10) {
                ForEach(rows.indices, id: \.self) { index in
                    HStack(spacing: 10) {
                        ForEach(rows[index], id: \.self) { value in
                            if rows[index].count == 2 {
                                HStack {
                                    Text("hello")
                                        .padding(.leading, 30)
                                    Spacer()
                                }
                                .frame(width: 175, height: 100)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(value.gradient)
                                        
                                )
                            } else {
                                HStack() {
                                    Text("hello")
                                        
                                    Spacer()
                                }
                                .frame(width: 175, height: 100)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(value.gradient)
                                        .frame(width: 370, height: 100)
                                )
                            }
                        }
                    }
                }
            }
            

            
            .onAppear {
                generateRows()
            }
            
        }
    }
    
    func generateRows() {
        //        var count = 0
        
        var generated: [Color] = []
        
        var count = 0
        
        
        for i in colors {
            
            generated.append(i)
            
            if rows.isEmpty {
                
                if generated.count == 2 {
                    rows.append(generated)
                    generated.removeAll()
                    count += 1
                }
                
                
            } else {
                
                if rows[count - 1].count == 2 {
                    
                    if generated.count == 1 {
                        rows.append(generated)
                        generated.removeAll()
                        count += 1
                    }
                    
                }  else {
                    if generated.count == 2 {
                        rows.append(generated)
                        generated.removeAll()
                        count += 1
                    }
                }
            }
        }
    }
}

struct NoteScrollView_Previews: PreviewProvider {
    static var previews: some View {
        
        let note = Note()
        let collection = NoteCollection()
        NoteScrollView(note: note, collection: collection)
    }
}
