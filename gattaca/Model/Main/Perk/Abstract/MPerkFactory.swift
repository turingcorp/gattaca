import Foundation
import CoreData

extension MPerk
{
    func factoryThumbnails() -> [MPerkThumbnailProtocol]
    {
        let perks:[MPerkThumbnailProtocol] = []
        
        return perks
    }
    
    func factoryDispatchGroup() -> DispatchGroup
    {
        let dispatchGroup:DispatchGroup = DispatchGroup()
        dispatchGroup.setTarget(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        
        return dispatchGroup
    }
    
    func factoryStoredPerks(
        completion:@escaping(([DPerk]?) -> ()))
    {
//        DManager.sharedInstance?.fetch(entity:DPerk.self)
//        { (data:[NSManagedObject]?) in
//            
//            let perks:[DPerk]? = data as? [DPerk]
//            completion(perks)
//        }
    }
    
    func factoryPerksMap(perks:[DPerk]) -> [String:DPerk]
    {
        var map:[String:DPerk] = [:]
        
        for perk:DPerk in perks
        {
            guard
                
                let identifier:String = perk.identifier
                
            else
            {
                continue
            }
            
            map[identifier] = perk
        }
        
        return map
    }
}
