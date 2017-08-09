import Foundation

extension MHome
{
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
        
            let directory:URL = DGif.gifDirectory()
        
        else
        {
            return items
        }
        
        for gifItem:DGif in gifItems
        {
            guard
            
                let path:URL = gifItem.factoryPath(
                    directory:directory)
            
            else
            {
                continue
            }
            
            let item:MHomeItem = MHomeItem(url:path)
            items.append(item)
        }
        
        return items
    }
}
