//
//  UserEntity+CoreDataProperties.swift
//  Shaadi.com
//
//  Created by Sumeet Verma on 25/03/25.
//
//

import Foundation
import CoreData


extension UserEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserEntity> {
        return NSFetchRequest<UserEntity>(entityName: "UserEntity")
    }

    @NSManaged public var uuid: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var city: String?
    @NSManaged public var country: String?
    @NSManaged public var imageURL: String?
    @NSManaged public var status: String?

}

extension UserEntity : Identifiable {

}
