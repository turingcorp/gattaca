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
    
    //MARK: internal
    
    func itemsLoaded(items:[DGif])
    {
        self.items = items
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
