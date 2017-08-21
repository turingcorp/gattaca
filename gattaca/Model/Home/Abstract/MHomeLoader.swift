import Foundation

extension MHome
{
    //MARK: notified
    
//    @objc
//    func notifiedGifDownloaded(sender notification:Notification)
//    {
//        NotificationCenter.default.removeObserver(self)
//        loadItems()
//    }
    
    //MARK: private
    
    private func asyncsLoadItems()
    {/*
        let gifItems:[DGif] = MSession.sharedInstance.gif.itemsWaiting()
        let countItems:Int = gifItems.count
        
        if countItems > 0
        {
            let items:[MHomeItem] = MHome.factoryItems(
                gifItems:gifItems)
            
            updateItems(items:items)
        }
        else
        {
            loadMoreGif()
        }*/
    }
    
    private func loadMoreGif()
    {
//        NotificationCenter.default.addObserver(
//            self,
//            selector:#selector(notifiedGifDownloaded(sender:)),
//            name:Notification.gifDownloaded,
//            object:nil)
        
        requestGif()
    }
    
    //MARK: internal
    
    func loadError(message:String)
    {
    }
    
    func asyncLoadItems(
        completion:@escaping(([MHomeItem]) -> ()))
    {
        guard
        
            let coreData:Database = self.coreData
        
        else
        {
            return
        }
        
        gif.strategy?.load(coreData:coreData)
        { [weak self] in
            
            self?.loadItemsDone(completion:completion)
        }
    }
    
    func loadItemsDone(
        completion:@escaping(([MHomeItem]) -> ()))
    {
        loadError(message:"dummy error")
        
//        let itemsReady:[DGif] = gif.itemsReady
//        let count:Int = itemsReady.count
//        
//        if count > 0
//        {
//            let items:[MHomeItem] = MHome.factoryItems(
//                gifItems:itemsReady)
//            
//            completion(items)
//        }
//        else
//        {
//            
//        }
    }
}
