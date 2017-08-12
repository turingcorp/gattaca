import Foundation

extension MPerk
{
    class func factoryPerks() -> [MPerkThumbnailProtocol]
    {
        let perks:[MPerkThumbnailProtocol] = []
        
        return perks
    }
    
    //MARK: private
    
    private class func factoryDispatchGroup() -> DispatchGroup
    {
        let dispatchGroup:DispatchGroup = DispatchGroup()
        dispatchGroup.setTarget(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        
        return dispatchGroup
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
    
    func loadPerks(completion:@escaping(() -> ()))
    {
        guard
            
            let perksMap:[String:DPerk] = settings?.perksMap()
            
            else
        {
            completion()
            return
        }
        
        let thumbnails:[MPerkThumbnailProtocol] = MSession.factoryPerks()
        let dispatchGroup:DispatchGroup = MSession.factoryDispatchGroup()
        
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
    
    //MARK: internal
    
    func loadPerks(completion:@escaping(() -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.loadPerks(completion:completion)
        }
    }
}
