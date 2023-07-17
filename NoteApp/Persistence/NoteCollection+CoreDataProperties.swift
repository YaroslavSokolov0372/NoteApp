//
//  NoteCollection+CoreDataProperties.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 23/06/2023.
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
    @NSManaged public var arrayOfTextFields: NSSet?
}

// MARK: Generated accessors for arrayOfTextFields
extension NoteCollection {

    @objc(addArrayOfTextFieldsObject:)
    @NSManaged public func addToArrayOfTextFields(_ value: TextFields)

    @objc(removeArrayOfTextFieldsObject:)
    @NSManaged public func removeFromArrayOfTextFields(_ value: TextFields)

    @objc(addArrayOfTextFields:)
    @NSManaged public func addToArrayOfTextFields(_ values: NSSet)

    @objc(removeArrayOfTextFields:)
    @NSManaged public func removeFromArrayOfTextFields(_ values: NSSet)

}

extension NoteCollection : Identifiable {

}
