import Foundation

class MGif
{
    private(set) var strategy:MGifStrategy?
    private(set) var items:[DGif]
    private var map:[String:DGif]
    
    init()
    {
        items = []
        map = [:]
        
        strategyStand()
    }
    
    //MARK: private
    
    private func mapItems(items:[DGif])
    {
        for item:DGif in items
        {
            mapItem(item:item)
        }
    }
    
    private func mapItem(item:DGif)
    {
        guard
            
            let identifier:String = item.identifier
            
        else
        {
            return
        }
        
        map[identifier] = item
    }
    
    //MARK: internal
    
    func strategyStand()
    {
        strategy = MGifStrategyStand(model:self)
    }
    
    func strategyDownload()
    {
        strategy = MGifStrategyDownload(model:self)
    }
    
    func itemsLoaded(items:[DGif])
    {
        self.items = items
        mapItems(items:items)
    }
    
    func addItem(item:DGif)
    {
        items.append(item)
        mapItem(item:item)
    }
    
    func itemsWaiting() -> [DGif]
    {
        var items:[DGif] = []
        
        for item:DGif in self.items
        {
            let status:DGif.Status = item.status
            
            if status == DGif.Status.waiting
            {
                items.append(item)
            }
        }
        
        return items
    }
    
    func firstItemNew() -> DGif?
    {
        for item:DGif in self.items
        {
            let status:DGif.Status = item.status
            
            if status == DGif.Status.new
            {
                return item
            }
        }
        
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
