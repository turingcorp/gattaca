import Foundation

class FDatabaseGifsUser:FDatabaseProtocol
{
    var identifier:String?
    var parent:FDatabaseProtocol?
    let items:[FDatabaseGifsUserItem]
    
    init(
        gifs:FDatabaseGifs,
        identifier:String)
    {
        self.identifier = identifier
        parent = gifs
        items = []
    }
    
    required init?(json:Any)
    {
        guard
            
            let rawItems:[String:Any] = json as? [String:AnyObject]
            
        else
        {
            return nil
        }
        
        var items:[FDatabaseGifsUserItem] = []
        let itemsIds:[String] = Array(rawItems.keys)
        
        for itemId:String in itemsIds
        {
            guard
                
                let rawItem:Any = rawItems[itemId],
                let item:FDatabaseGifsUserItem = FDatabaseGifsUserItem(
                    json:rawItem)
                
            else
            {
                continue
            }
            
            item.identifier = itemId
            items.append(item)
        }
        
        self.items = items
    }
}
