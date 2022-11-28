//
//  Fact+CoreDataProperties.swift
//  
//
//  Created by Афанасьев Александр Иванович on 27.11.2022.
//
//

import Foundation
import CoreData


extension Fact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Fact> {
        return NSFetchRequest<Fact>(entityName: "Fact")
    }
    
    public override var description: String {
        return "Fact"
    }

    @NSManaged public var fact: String?
    @NSManaged public var factId: Int64
    @NSManaged public var anime: Anime?

}
