//
//  NoteAppApp.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 22/06/2023.
//

import SwiftUI

@main
struct NoteAppApp: App {
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
            
            
            
//                .environmentObject(dataController)
        }
    }
}
