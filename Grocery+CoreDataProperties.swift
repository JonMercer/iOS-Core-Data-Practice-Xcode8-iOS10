//
//  Grocery+CoreDataProperties.swift
//  iOS-Core-Data-Practice-Xcode8-iOS10
//
//  Created by Odin on 2016-12-12.
//  Copyright © 2016 jonmercer. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Grocery {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Grocery> {
        return NSFetchRequest<Grocery>(entityName: "Grocery");
    }

    @NSManaged public var item: String?

}
