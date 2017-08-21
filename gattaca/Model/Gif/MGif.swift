import Foundation

class MGif
{
    var itemsReady:[DGif]
    var itemsNotReady:[DGif]
    var map:[String:DGif]
    private(set) var strategy:MGifStrategy?
    
    init()
    {
        itemsReady = []
        itemsNotReady = []
        map = [:]
        
        strategyNotLoaded()
    }
    
    //MARK: internal
    
    func strategyNotLoaded()
    {
        strategy = MGifStrategyNotLoaded(model:self)
    }
    
    func strategyStand()
    {
        strategy = MGifStrategyStand(model:self)
    }
    
    func strategyDownload()
    {
        strategy = MGifStrategyDownload(model:self)
    }
    
    func addItem(item:DGif)
    {
//        items.append(item)
//        mapItem(item:item)
    }
    
    func itemsWaiting() -> [DGif]
    {
        var items:[DGif] = []
        
//        for item:DGif in self.items
//        {
//            let status:DGif.Status = item.status
//            
//            if status == DGif.Status.waiting
//            {
//                items.append(item)
//            }
//        }
        
        return items
    }
    
    func firstItemNew() -> DGif?
    {
//        for item:DGif in self.items
//        {
//            let status:DGif.Status = item.status
//            
//            if status == DGif.Status.new
//            {
//                return item
//            }
//        }
        
        return nil
    }
    
    func purgeItems(items:[MGiphyItem]) -> [MGiphyItem]
    {
        var purged:[MGiphyItem] = []
        
        for item in items
        {
            let identifier:String = item.identifier
            
            if map[identifier] == nil
            {
                purged.append(item)
            }
        }
        
        return purged
    }
}
