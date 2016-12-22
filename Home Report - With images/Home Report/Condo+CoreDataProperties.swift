//
//  Condo+CoreDataProperties.swift
//  Home Report
//
//  Created by Andi Setiyadi on 8/31/16.
//  Copyright © 2016 devhubs. All rights reserved.
//

import Foundation
import CoreData

extension Condo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Condo> {
        return NSFetchRequest<Condo>(entityName: "Condo");
    }

    @NSManaged public var unitsPerBuilding: Int16

}
