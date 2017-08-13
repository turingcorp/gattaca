import Foundation

extension MPerk
{
    //MARK: private
    
    private func asyncLoadPerks(
        completion:@escaping(() -> ()))
    {
        factoryStoredPerks
        { [weak self] (perks:[DPerk]?) in
            
            guard
            
                let storedPerks:[DPerk] = perks
            
            else
            {
                completion()
                return
            }
            
            self?.asyncLoadPerks(
                storedPerks:storedPerks,
                completion:completion)
        }
    }
    
    private func asyncLoadPerks(
        storedPerks:[DPerk],
        completion:@escaping(() -> ()))
    {
        let perksMap:[String:DPerk] = factoryPerksMap(
            perks:storedPerks)
        let thumbnails:[MPerkThumbnailProtocol] = factoryThumbnails()
        let dispatchGroup:DispatchGroup = factoryDispatchGroup()
        
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
        { [weak self] (perk:DPerk?) in
            
            if let perk:DPerk = perk
            {
                self?.items.append(perk)
            }
            
            dispatchGroup.leave()
        }
    }
    
    //MARK: internal
    
    func loadPerks(completion:@escaping(() -> ()))
    {
        items = []
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadPerks(completion:completion)
        }
    }
}
