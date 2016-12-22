//
//  SingleFamily+CoreDataProperties.swift
//  Home Report
//
//  Created by Andi Setiyadi on 8/31/16.
//  Copyright © 2016 devhubs. All rights reserved.
//

import Foundation
import CoreData

extension SingleFamily {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SingleFamily> {
        return NSFetchRequest<SingleFamily>(entityName: "SingleFamily");
    }

    @NSManaged public var lotSize: Int16

}
