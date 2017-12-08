//
//  Journal+CoreDataProperties.swift
//  Journals
//
//  Created by Hsiao Ai LEE on 08/12/2017.
//  Copyright © 2017 Hsiao Ai LEE. All rights reserved.
//
//

import Foundation
import CoreData

extension Journal {

    public class func fetchRequest() -> NSFetchRequest<Journal> {

        let request = NSFetchRequest<Journal>(entityName: "Journal")

        request.sortDescriptors = [NSSortDescriptor(key: "createDate", ascending: false)]

        return request
    }

    @NSManaged public var title: String?

    @NSManaged public var content: String?

    @NSManaged public var photo: NSData?

    @NSManaged public var isCompleted: Bool

    @NSManaged public var createDate: NSDate?

}
