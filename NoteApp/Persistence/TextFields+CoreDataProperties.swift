//
//  TextFields+CoreDataProperties.swift
//  NoteApp
//
//  Created by Yaroslav Sokolov on 23/06/2023.
//
//

import Foundation
import CoreData


extension TextFields {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TextFields> {
        return NSFetchRequest<TextFields>(entityName: "TextFields")
    }

    @NSManaged public var text: String?
    @NSManaged public var ownerOfTextField: NoteCollection?

}

extension TextFields : Identifiable {

}
