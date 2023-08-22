//
//  NoteSketch.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 17/08/2023.
//

import SwiftUI

struct NoteSketch: View {
    
    @GestureState var press = false
    @State var show = false
    
    
    
    
    @State var settingMode: Bool = false
    @State var email: String = ""
    
    var body: some View {
//        HStack {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        }
//        .frame(width: 150, height: 40)
//        .background(
//            RoundedRectangle(cornerRadius: 10)
//                .fill(press ? Color.green.opacity(0.5) : Color.red.opacity(0.5))
//        )
//        .scaleEffect(press ? 2 : 1)
//        .animation(.spring(response: 0.4, dampingFraction: 0.6), value: press)
//        .gesture(
//            LongPressGesture(minimumDuration: 0.5)
//                .updating($press, body: { currentState, gestureState, transaction in
//                    gestureState = currentState
//                })
//                .onEnded({ value in
//                    show.toggle()
//                })
//        )
        
        HStack {
            Text("Hello")
                .padding()
                .frame(width: 120)
                .background(Color.green.opacity(0.5))
                .cornerRadius(15)
                
                
            
            
//                .offset(x: settingMode ? -8 : 0)
                .rotationEffect(.degrees(settingMode ? 5 : 0))
                .animation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2) .repeatForever(autoreverses: true).speed(20), value: settingMode)

//                .scaleEffect(settingMode ? 2 : 1)
//                .animation(.spring(response: 0.4, dampingFraction: 0.6), value: settingMode)
                .onLongPressGesture(minimumDuration: 1.5) {
                    
                    settingMode.toggle()

                }
                

        }
        
    }
    

    
    
    
    
}

struct NoteSketch_Previews: PreviewProvider {
    static var previews: some View {
        NoteSketch()
    }
}




func shake(_ loop: Bool = true){
    
}



//    .rotationEffect(.degrees(settingMode ? 2 : 0))
//    .animation(
//        Animation.spring(response: 0.2,
//                         dampingFraction: 0.2,
//                         blendDuration: 0.2)
//        .repeatForever(autoreverses: true)
//        .speed(20),
//        value: settingMode)
//    .onLongPressGesture(minimumDuration: 1.5) {
//        settingMode.toggle()
//    }
