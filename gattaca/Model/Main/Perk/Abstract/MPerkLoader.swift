import Foundation
import CoreData

extension MPerk
{
    //MARK: private
    
    private func factoryThumbnails() -> [MPerkThumbnailProtocol]
    {
        let perks:[MPerkThumbnailProtocol] = []
        
        return perks
    }
    
    private func factoryDispatchGroup() -> DispatchGroup
    {
        let dispatchGroup:DispatchGroup = DispatchGroup()
        dispatchGroup.setTarget(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        
        return dispatchGroup
    }
    
    private func loadSavedPerks(
        completion:@escaping(([DPerk]?) -> ()))
    {
        DManager.sharedInstance?.fetch(entity:DPerk.self)
        { (data:[NSManagedObject]?) in
            
            let perks:[DPerk]? = data as? [DPerk]
            completion(perks)
        }
    }
    
    private func asyncLoadPerks(completion:@escaping(() -> ()))
    {
        MPerk.loadSavedPerks
        { [weak self] (perks:[DPerk]?) in
            
            <#code#>
        }
        
        
        guard
            
            let perksMap:[String:DPerk] = settings?.perksMap()
            
        else
        {
            completion()
            return
        }
        
        let thumbnails:[MPerkThumbnailProtocol] = MPerk.factoryThumbnails()
        let dispatchGroup:DispatchGroup = MPerk.factoryDispatchGroup()
        
        loadPerks(
            perksMap:perksMap,
            thumbnails:thumbnails,
            dispatchGroup:dispatchGroup)
        
        dispatchGroup.notify(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        {
            completion()
        }
    }
    
    private func loadPerks(
        perksMap:[String:DPerk],
        thumbnails:[MPerkThumbnailProtocol],
        dispatchGroup:DispatchGroup)
    {
        for thumbnail:MPerkThumbnailProtocol in thumbnails
        {
            dispatchGroup.enter()
            
            let identifier:String = thumbnail.identifier()
            
            if perksMap[identifier] == nil
            {
                addThumbnail(
                    thumbnail:thumbnail,
                    dispatchGroup:dispatchGroup)
            }
        }
    }
    
    private func addThumbnail(
        thumbnail:MPerkThumbnailProtocol,
        dispatchGroup:DispatchGroup)
    {
        thumbnail.createPerk
        { (perk:DPerk?) in
            
            perk?.settings = self.settings
            dispatchGroup.leave()
        }
    }
    
    //MARK: internal
    
    func loadPerks(completion:@escaping(([DPerk]) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asynLoadPerks(completion:completion)
        }
    }
}
