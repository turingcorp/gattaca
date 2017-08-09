import Foundation

class MSessionGif
{
    private(set) var items:[DGif]
    private var map:[String:DGif]
    private var indexWaiting:Int
    private var indexLoading:Int
    
    init()
    {
        items = []
        map = [:]
        indexLoading = 0
        indexWaiting = 0
    }
    
    //MARK: internal
    
    func itemsLoaded(items:[DGif])
    {
        self.items = items
        
    }
    
    func currentItem() -> DGif?
    {
        if indexWaiting < items.count
        {
            let item:DGif = items[indexWaiting]
            
            return item
        }
        
        return nil
    }
}
