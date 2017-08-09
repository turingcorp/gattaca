import Foundation

extension MHome
{
    func loadItems()
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.dispatchLoadItems()
        }
    }
    
    //MARK: private
    
    private func dispatchLoadItems()
    {
        let gifItems:[DGif] = MSession.sharedInstance.gif.itemsWaiting()
        let countItems:Int = items.count
        
        if countItems > 0
        {
            let items:[MHomeItem] = MHome.factoryItems(
                gifItems:gifItems)
            
            updateItems(items:items)
        }
        else
        {
            requestGiphyTrending()
        }
    }
}
