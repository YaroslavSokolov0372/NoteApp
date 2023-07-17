//
//  ContentView.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 22/06/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @Environment(\.managedObjectContext) var dataController
    
    var body: some View {
        
        Home()
            .preferredColorScheme(.dark)
            .environmentObject(dataController)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



