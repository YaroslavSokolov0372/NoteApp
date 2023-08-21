//
//  NoteScollViewCard.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 20/08/2023.
//

import SwiftUI

struct NoteScollViewCard: View {
    
    
    @State var isFavorite: Bool = false
    
    var body: some View {
        
        VStack {
            
                HStack {
                    VStack(alignment: .leading, spacing: -3) {
                        Text("Plan for The Day....")
//                            .frame(width: 80)
                            .lufga(20, .medium)
                            .padding(.bottom, 10)
                        
                        
                        Text("Updated 2h ago")
                            .lufga(15, .light)
                    }
                    .padding(.leading, 4)
                    
                    Spacer()
                    
                    
                    
                }
                .frame(width: 350, height: 80)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color("PastelGreen"))
                )
                .overlay {
                    Button {
                        isFavorite.toggle()
                    } label: {
                        Image(isFavorite ? "HeartRed" : "Heart")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .background(
                                Circle()
                                    .fill(Color.black.opacity(0.2))
                                    .frame(width: 70, height: 70)
                                
                                
                            )
                    }
                    .offset(x: 150)
                    .padding(.trailing, 10)
                    .padding(.bottom, 7)
                }
                
            HStack {
                HStack {
                    VStack(alignment: .leading, spacing: -3) {
                        Text("Plan for The Day....")
    //                            .frame(width: 80)
                            .lufga(20, .medium)
                            .padding(.bottom, 10)
                        
                        
                        Text("Updated 2h ago")
                            .lufga(15, .light)
                    }
                    .padding(.leading, 4)
                    
                    Spacer()
                    
                    Button {
                        isFavorite.toggle()
                    } label: {
                        Image(isFavorite ? "HeartRed" : "Heart")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .background(
                                Circle()
                                    .fill(Color.black.opacity(0.2))
                                    .frame(width: 70, height: 70)
                                
                                
                            )
                    }
                    .padding(.trailing, 10)
                    .padding(.bottom, 7)
                }
                .frame(width: 155, height: 250)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color("PastelGreen"))
                )
                
                HStack {
                    VStack(alignment: .leading, spacing: -3) {
                        Text("Plan for The Day....")
    //                            .frame(width: 80)
                            .lufga(20, .medium)
                            .padding(.bottom, 10)
                        
                        
                        Text("Updated 2h ago")
                            .lufga(15, .light)
                    }
                    .padding(.leading, 4)
                    
                    Spacer()
                    
                    Button {
                        isFavorite.toggle()
                    } label: {
                        Image(isFavorite ? "HeartRed" : "Heart")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .background(
                                Circle()
                                    .fill(Color.black.opacity(0.2))
                                    .frame(width: 70, height: 70)
                                
                                
                            )
                    }
                    .padding(.trailing, 10)
                    .padding(.bottom, 7)
                    
                }
                .frame(width: 155, height: 250)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color("PastelGreen"))
                )
            }
            
            
            
            Spacer()
        }
    }
}

struct NoteScollViewCard_Previews: PreviewProvider {
    static var previews: some View {
        NoteScollViewCard()
    }
}
