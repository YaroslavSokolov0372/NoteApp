//
//  NoteCollection+CoreDataProperties.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 18/08/2023.
//
//

import Foundation
import CoreData


extension NoteCollection {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteCollection> {
        return NSFetchRequest<NoteCollection>(entityName: "NoteCollection")
    }

    @NSManaged public var name: String?
    @NSManaged public var uid: UUID?
    @NSManaged public var notes: NSSet?

}

// MARK: Generated accessors for notes
extension NoteCollection {

    @objc(addNotesObject:)
    @NSManaged public func addToNotes(_ value: Note)

    @objc(removeNotesObject:)
    @NSManaged public func removeFromNotes(_ value: Note)

    @objc(addNotes:)
    @NSManaged public func addToNotes(_ values: NSSet)

    @objc(removeNotes:)
    @NSManaged public func removeFromNotes(_ values: NSSet)

}

extension NoteCollection : Identifiable {

}
