import Foundation

extension MGiphy
{
    private static let kKeyData:String = "data"
    private static let kKeyIdentifier:String = "id"
    
    class func factoryItems(json:Any) -> [MGiphyItem]
    {
        var items:[MGiphyItem] = []
        
        guard
            
            let jsonMap:[String:AnyObject] = json as? [String:AnyObject],
            let datas:[AnyObject] = jsonMap[kKeyData] as? [AnyObject]
            
        else
        {
            return items
        }
        
        for data:AnyObject in datas
        {
            guard
            
                let item:MGiphyItem = parseItem(data:data)
            
            else
            {
                continue
            }
            
            items.append(item)
        }
        
        return items
    }
    
    //MARK: private
    
    private class func parseItem(data:AnyObject) -> MGiphyItem?
    {
        guard
        
            let dataMap:[String:AnyObject] = data as? [String:AnyObject],
            let identifier:String = dataMap[kKeyIdentifier] as? String
        
        else
        {
            return nil
        }
        
        let item:MGiphyItem = MGiphyItem(identifier:identifier)
        
        return item
    }
}
