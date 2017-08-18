import Foundation

extension MHome
{
    //MARK: notified
    
    @objc
    func notifiedGifDownloaded(sender notification:Notification)
    {
        NotificationCenter.default.removeObserver(self)
        loadItems()
    }
    
    //MARK: private
    
    private func dispatchLoadItems()
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
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedGifDownloaded(sender:)),
            name:Notification.gifDownloaded,
            object:nil)
        
        requestGif()
    }
    
    //MARK: internal
    
    func loadItems()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.dispatchLoadItems()
        }
    }
}
