import Foundation

class MSessionGif
{
    var index:Int
    private(set) var items:[DGif]
    private var map:[String:DGif]
    
    init()
    {
        items = []
        map = [:]
        index = 0
    }
    
    //MARK: internal
    
    func currentItem() -> DGif?
    {
        if index < items.count
        {
            let item:DGif = items[index]
            
            return item
        }
        
        return nil
    }
}
