import Foundation

extension MGif
{
    //MARK: internal
    
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
