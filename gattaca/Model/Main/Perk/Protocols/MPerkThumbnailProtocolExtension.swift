import Foundation
import CoreData

extension MPerkThumbnailProtocol
{
    func identifier() -> String
    {
        let classType:AnyClass = object_getClass(self)
        let nameString:String = NSStringFromClass(classType)
        
        return nameString
    }
    
    func domainIdentifier() -> String
    {
        let classType:AnyClass = object_getClass(domainType)
        let nameString:String = NSStringFromClass(classType)
        
        return nameString
    }
    
    func createPerk(completion:@escaping((DPerk?) -> ()))
    {
        let identifierString:String = identifier()
        let domainIdentifierString:String = domainIdentifier()
        /*
        DManager.sharedInstance?.create(entity:dPerkType)
        { (data:NSManagedObject?) in
            
            guard
                
                let perk:DPerk = data as? DPerk
                
            else
            {
                completion(nil)
                return
            }
            
            perk.identifier = identifierString
            perk.domainIdentifier = domainIdentifierString
            
            completion(perk)
        }*/
    }
}
