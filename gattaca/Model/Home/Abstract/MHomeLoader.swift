import Foundation

extension MHome
{
    //MARK: internal
    
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
        let itemsReady:[DGif] = gif.itemsReady
        let count:Int = itemsReady.count
        
        if count > 0
        {
            let items:[MHomeItem] = MHome.factoryItems(
                gifItems:itemsReady)
            gif.strategy?.download()
            
            completion(items)
        }
        else
        {
            requestGifs()
        }
    }
}
