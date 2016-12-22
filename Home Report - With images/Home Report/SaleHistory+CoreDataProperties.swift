//
//  SaleHistory+CoreDataProperties.swift
//  Home Report
//
//  Created by Andi Setiyadi on 9/11/16.
//  Copyright © 2016 devhubs. All rights reserved.
//

import Foundation
import CoreData

extension SaleHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SaleHistory> {
        return NSFetchRequest<SaleHistory>(entityName: "SaleHistory");
    }

    @NSManaged public var soldDate: Date?
    @NSManaged public var soldPrice: Double
    @NSManaged public var home: Home?

}
