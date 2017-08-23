import Foundation

extension MHome
{
    //MARK: private
    
    private func asyncMarkCurrent(action:MHomeActionProtocol)
    {
        guard
        
            let coreData:Database = self.coreData,
            let item:DGif = markingItem(),
            let userId:String = session.userId
        
        else
        {
            return
        }
        
        markFirebase(
            userId:userId,
            item:item,
            mark:action.mark)
        markCoreData(
            coreData:coreData,
            item:item,
            mark:action.mark)
        { [weak self] in
            
            self?.markingDone(item:item)
            self?.view?.markingDone(action:action)
        }
    }
    
    //MARK: internal
    
    func markCurrent(action:MHomeActionProtocol)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncMarkCurrent(action:action)
        }
    }
    
    func markingItem() -> DGif?
    {
        guard
        
            let item:MHomeItem = items.first
        
        else
        {
            return nil
        }
        
        return item.gif
    }
    
    func markFirebase(
        userId:String,
        item:DGif,
        mark:DGif.Mark)
    {
        guard
            
            let itemId:String = item.identifier
        
        else
        {
            return
        }
        
        let firebase:FDatabase = FDatabase()
        let gifs:FDatabaseGifs = FDatabaseGifs()
        let gifsUser:FDatabaseGifsUser = FDatabaseGifsUser(
            gifs:gifs,
            identifier:userId)
        let gifsUserItem:FDatabaseGifsUserItem = FDatabaseGifsUserItem(
            user:gifsUser,
            identifier:itemId,
            mark:mark)
        
        firebase.update(model:gifsUserItem)
    }
    
    func markCoreData(
        coreData:Database,
        item:DGif,
        mark:DGif.Mark,
        completion:@escaping(() -> ()))
    {
        item.mark = mark
        coreData.save(completion:completion)
    }
    
    func markingDone(item:DGif)
    {
        removeFirst(gif:item)
        
        guard
        
            let firstReady:DGif = gif.itemsReady.first
        
        else
        {
            return
        }
        
        if firstReady === item
        {
            gif.itemsReady.removeFirst()
        }
        
        let countReady:Int = gif.itemsReady.count
        
        if countReady == 0
        {
            loadItems()
        }
    }
}
