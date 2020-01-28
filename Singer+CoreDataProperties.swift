//
//  Singer+CoreDataProperties.swift
//  Dynamically
//
//  Created by AARON KORN on 1/28/20.
//  Copyright © 2020 Aaron KoRn. All rights reserved.
//
//

import Foundation
import CoreData


extension Singer {
  
  @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
    return NSFetchRequest<Singer>(entityName: "Singer")
  }
  
  @NSManaged public var firstName: String?
  @NSManaged public var lastName: String?
  
  var wrappedFirstName: String {
    firstName ?? "Unknown"
  }
  
  var wrappedLastName: String {
    lastName ?? "Unknown"
  }
  
}
