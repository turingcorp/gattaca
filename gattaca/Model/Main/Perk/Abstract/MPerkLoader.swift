import Foundation

extension MPerk
{
    //MARK: private
    
    private func asyncLoadPerks(
        completion:@escaping(([DPerk]) -> ()))
    {
        factoryStoredPerks
        { [weak self] (perks:[DPerk]?) in
            
            guard
            
                let storedPerks:[DPerk] = perks
            
            else
            {
                completion(nil)
            }
            
            self?.asyncLoadPerks(
                storedPerks:storedPerks,
                completion:completion)
        }
    }
    
    private func asyncLoadPerks(
        storedPerks:[DPerk],
        completion:@escaping(([DPerk]) -> ()))
    {
        var perks:[DPerk] = []
        let perksMap:[String:DPerk] = factoryPerksMap(
            perks:storedPerks)
        let thumbnails:[MPerkThumbnailProtocol] = factoryThumbnails()
        let dispatchGroup:DispatchGroup = factoryDispatchGroup()
        
        loadPerks(
            perks:&perks,
            perksMap:perksMap,
            thumbnails:thumbnails,
            dispatchGroup:dispatchGroup)
        
        dispatchGroup.notify(
            queue:DispatchQueue.global(
                qos:DispatchQoS.QoSClass.background))
        {
            completion(perks)
        }
    }
    
    private func loadPerks(
        perks:inout[DPerk],
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
                    perks:&perks,
                    thumbnail:thumbnail,
                    dispatchGroup:dispatchGroup)
            }
        }
    }
    
    private func addThumbnail(
        perks:inout[DPerk],
        thumbnail:MPerkThumbnailProtocol,
        dispatchGroup:DispatchGroup)
    {
        thumbnail.createPerk
        { (perk:DPerk?) in
            
            if let perk:DPerk = perk
            {
                perks.append(perk)
            }
            
            dispatchGroup.leave()
        }
    }
    
    //MARK: internal
    
    func loadPerks(completion:@escaping(([DPerk]) -> ()))
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncLoadPerks(completion:completion)
        }
    }
}
