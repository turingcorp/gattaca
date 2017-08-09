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
    
    //MARK: private
    
    private func lookIndexes()
    {
        var itemIndex:Int = 0
        var indexLoading:Int?
        var indexWaiting:Int?
        
        for item:DGif in items
        {
            let status:DGif.Status = item.status
            
            switch status
            {
            case DGif.Status.new,
                 DGif.Status.loading:
                
                if indexLoading == nil
                {
                    indexLoading = itemIndex
                }
                
                break
                
            case DGif.Status.waiting:
                
                if indexWaiting == nil
                {
                    indexWaiting = itemIndex
                }
                
                break
                
            default:
                break
            }
            
            itemIndex += 1
            
            if indexLoading != nil
            {
                break
            }
        }
        
        indexesFound(indexLoading:indexLoading, indexWaiting:indexWaiting)
    }
    
    private func indexesFound(indexLoading:Int?, indexWaiting:Int?)
    {
        if let indexLoading:Int = indexLoading
        {
            self.indexLoading = indexLoading
        }
        
        if let indexWaiting:Int = indexWaiting
        {
            self.indexWaiting = indexWaiting
        }
    }
    
    //MARK: internal
    
    func itemsLoaded(items:[DGif])
    {
        self.items = items
        lookIndexes()
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
