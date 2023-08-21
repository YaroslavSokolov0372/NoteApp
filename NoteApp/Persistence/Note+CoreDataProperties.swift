//
//  Note+CoreDataProperties.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 18/08/2023.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var name: String?
    @NSManaged public var text: String?
    @NSManaged public var color: String?
    @NSManaged public var collections: NSSet?
    @NSManaged public var time: Date?

}

// MARK: Generated accessors for collections
extension Note {

    @objc(addCollectionsObject:)
    @NSManaged public func addToCollections(_ value: NoteCollection)

    @objc(removeCollectionsObject:)
    @NSManaged public func removeFromCollections(_ value: NoteCollection)

    @objc(addCollections:)
    @NSManaged public func addToCollections(_ values: NSSet)

    @objc(removeCollections:)
    @NSManaged public func removeFromCollections(_ values: NSSet)

}

extension Note : Identifiable {

}
