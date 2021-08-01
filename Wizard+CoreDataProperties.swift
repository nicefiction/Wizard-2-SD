// Wizard+CoreDataProperties.swift

// MARK: - LIBRARIES -

import Foundation
import CoreData



extension Wizard {
   
   @nonobjc
   public class func fetchRequest()
   -> NSFetchRequest<Wizard> {
      
      return NSFetchRequest<Wizard>(entityName: "Wizard")
   }
   
   
   
   @NSManaged public var name: String?
   
   
   
   // MARK: - COMPUTED PROPERTIES
   
   var computedName: String { return name ?? "N/A" }
   
}




// MARK: - EXTENSIONS -

extension Wizard : Identifiable {}
