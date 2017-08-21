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
    
    func mapItem(item:DGif)
    {
        guard
            
            let identifier:String = item.identifier
            
        else
        {
            return
        }
        
        map[identifier] = item
    }
    
    func newItem(item:DGif)
    {
        itemsNotReady.append(item)
        mapItem(item:item)
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
