//
//  DataController.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 07/08/2023.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "NoteApp")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load:", error.localizedDescription)
            }
        }
    }
}
