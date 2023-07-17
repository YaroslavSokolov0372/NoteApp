//
//  HomeViewModel.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 23/06/2023.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    
    @Published var nameOfCollection: String = ""
    @Published var showNewCollection: Bool = false
    @Published var creatingNewNote: Bool = false
//    @Published var shouldShowSheet: Bool = false
    
    
    func addCollection(managedContext: NSManagedObjectContext) {

        let collection = NoteCollection(context: managedContext)
        
        collection.name = nameOfCollection
        collection.uid = UUID()
        
        do {
            try managedContext.save()
        } catch {
            let error = error as NSError
            print("Error \(error), \(error.localizedDescription)")
        }
        nameOfCollection = ""
    }
}

