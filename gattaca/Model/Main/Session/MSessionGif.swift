import Foundation

class MSessionGif
{
    private(set) var items:[DGif]
    private var map:[String:DGif]
    
    init()
    {
        items = []
        map = [:]
    }
    
    //MARK: private
    
    private func mapItems(items:[DGif])
    {
        var map:[String:DGif] = [:]
        
        for item:DGif in items
        {
            guard
            
                let identifier:String = item.identifier
            
            else
            {
                continue
            }
            
            map[identifier] = item
        }
        
        self.map = map
    }
    
    //MARK: internal
    
    func itemsLoaded(items:[DGif])
    {
        self.items = items
        mapItems(items:items)
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
}
