//
//  Record+CoreDataProperties.swift
//  
//
//  Created by 松本真太朗 on 2021/07/01.
//
//

import Foundation
import CoreData


extension Record: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Record> {
        return NSFetchRequest<Record>(entityName: "Record")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var span: String?
    @NSManaged public var startDate: String?

}
