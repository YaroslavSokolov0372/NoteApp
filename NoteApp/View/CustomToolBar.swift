//
//  CustomToolBar.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 25/06/2023.
//

import SwiftUI

struct CustomToolBar: View {
    
    @Binding var activeItem: toolBarItems
    
    
    var body: some View {
        HStack {
            ForEach(toolBarItems.allCases, id: \.rawValue) { string in
                
                Button {
                    activeItem = string
                    print(notesElement)
                    switch string {
                    case .plus:
//                        return notesElement.append(CustomTextField.self as! (any View))
                        return withAnimation {
                            notesElement.append(CustomTextField())
                        }
                        
                    default: return
                        
                    }
                    
                } label: {
                    if string == .plus {
                        Image(systemName: string.rawValue)
                            .foregroundColor(activeItem == .plus ? .white : .black)
                            .font(.system(size: 30))
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(activeItem == string ? .black : .black.opacity(0.2))
                            }
                        
                    } else {
                        Image(activeItem == string ? "\(string.rawValue)White" : string.rawValue)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 35)
                                    .fill(activeItem == string ? .black : .black.opacity(0.10))
                            }
                    }
                }
            }
        }
        .padding(3)
        .background {
            RoundedRectangle(cornerRadius: 35)
                .fill(.black.opacity(0.1))
        }
    }
}

struct CustomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomToolBar(activeItem: .constant(.plus))
    }
}
