//
//  NoteScrollView.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 19/08/2023.
//

import SwiftUI

struct NoteScrollView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    
    @State var nameOfCollection = ""
    
    
    var body: some View {
        VStack {
            VStack {
                Text("Delete Note?")
                    .foregroundColor(.white)
                    .lufga(27, .regular)
                    .offset(y: -13)
            }
            .frame(width: 280, height: 90)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(lineWidth: 1)
                    .fill(.white)
                    .background(RoundedRectangle(cornerRadius: 30)
                        .fill(.black)
                    )
                )
        

            
            HStack {
                
                Button {
                    
                } label: {
                    Image("TickWhite")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .offset(x: -1)
                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 35)
//                                .fill(Color("GrayLight"))
//                        )
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                                .fill(.white)
                                .background(
                                    Circle()
                                        .fill(Color.black)
                                )
                        )

                    
                }
                .padding(.trailing, 30)

                Button {
                } label: {
                    Image("CrossWhite")
                        
                        .resizable()
                        .frame(width: 40, height: 40)
                        .offset(x: -1)
                        .padding()
                        .background(
                            Circle()
                                .stroke(lineWidth: 1)
                                .fill(.white)
                                .background(
                                    Circle()
                                        .fill(Color.black)
                                )
                        )

                }
                
                
                .padding(.leading, 30)
                
            }
            .offset(y: -40)
            
            
        }
        
        

        
    }
    
//    func generateRows() {
//        //        var count = 0
//
//        var generated: [Color] = []
//
//        var count = 0
//
//
//        for i in colors {
//
//            generated.append(i)
//
//            if rows.isEmpty {
//
//                if generated.count == 2 {
//                    rows.append(generated)
//                    generated.removeAll()
//                    count += 1
//                }
//
//
//            } else {
//
//                if rows[count - 1].count == 2 {
//
//                    if generated.count == 1 {
//                        rows.append(generated)
//                        generated.removeAll()
//                        count += 1
//                    }
//
//                }  else {
//                    if generated.count == 2 {
//                        rows.append(generated)
//                        generated.removeAll()
//                        count += 1
//                    }
//                }
//            }
//        }
//    }
}

struct NoteScrollView_Previews: PreviewProvider {
    static var previews: some View {
        
//        let note = Note()
//        let collection = NoteCollection()
//        NoteScrollView(note: note, collection: collection)
        NoteScrollView()
            .preferredColorScheme(.dark)
    }
}
