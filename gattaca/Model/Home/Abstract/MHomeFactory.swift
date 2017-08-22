import Foundation

extension MHome
{
    //MARK: internal
    
    class func factoryActions() -> [MHomeActionProtocol]
    {
        let itemHate:MHomeActionHate = MHomeActionHate()
        let itemMeh:MHomeActionMeh = MHomeActionMeh()
        let itemLike:MHomeActionLike = MHomeActionLike()
        
        let items:[MHomeActionProtocol] = [
            itemHate,
            itemMeh,
            itemLike]
        
        return items
    }
    
    class func factoryItems(gifItems:[DGif]) -> [MHomeItem]
    {
        var items:[MHomeItem] = []
        
        guard
        
            let directory:URL = MGif.directory()
        
        else
        {
            return items
        }
        
        for gifItem:DGif in gifItems
        {
            guard
            
                let identifier:String = gifItem.identifier,
                let path:URL = MGif.factoryPath(
                    identifier:identifier,
                    directory:directory)
            
            else
            {
                continue
            }
            
            let item:MHomeItem = MHomeItem(
                url:path,
                gif:gifItem)
            items.append(item)
        }
        
        return items
    }
}
