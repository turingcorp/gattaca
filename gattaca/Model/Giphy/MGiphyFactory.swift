import Foundation

extension MGiphy
{
    private static let kKeyData:String = "data"
    private static let kKeyIdentifier:String = "id"
    private static let kKeyGiphy:String = "giphy"
    private static let kKeyDownloadPrefix:String = "download_prefix"
    private static let kKeyShareSuffix:String = "share_suffix"
    
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
    
    class func factoryShareGifUrl(model:MHomeItem) -> URL?
    {
        guard
            
            let urlMap:[String:AnyObject] = MRequest.factoryUrlMap(),
            let giphy:[String:AnyObject] = urlMap[kKeyGiphy] as? [String:AnyObject],
            let downloadPrefix:String = giphy[kKeyDownloadPrefix] as? String,
            let shareSuffix:String = giphy[kKeyShareSuffix] as? String,
            let itemId:String = model.gif?.identifier
            
        else
        {
            return nil
        }
        
        var gifString:String = downloadPrefix
        gifString.append(itemId)
        gifString.append(shareSuffix)
        
        let url:URL? = URL(string:gifString)
        
        return url
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
