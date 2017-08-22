import Foundation

extension MGiphy
{
    private static let kKeyData:String = "data"
    private static let kKeyIdentifier:String = "id"
    private static let kKeyGiphy:String = "giphy"
    private static let kKeyDownloadPrefix:String = "download_prefix"
    private static let kKeyShareSuffix:String = "share_suffix"
    
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
    
    //MARK: internal
    
    class func factoryItems(json:Any) -> [MGiphyItem]?
    {
        guard
            
            let jsonMap:[String:AnyObject] = json as? [String:AnyObject],
            let datas:[AnyObject] = jsonMap[kKeyData] as? [AnyObject]
            
        else
        {
            return nil
        }
        
        var items:[MGiphyItem] = []
        
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
    
    class func factoryShareGifUrl(identifier:String) -> URL?
    {
        guard
            
            let urlMap:[String:AnyObject] = MRequest.factoryUrlMap(),
            let giphy:[String:AnyObject] = urlMap[kKeyGiphy] as? [String:AnyObject],
            let downloadPrefix:String = giphy[kKeyDownloadPrefix] as? String,
            let shareSuffix:String = giphy[kKeyShareSuffix] as? String
            
        else
        {
            return nil
        }
        
        var gifString:String = downloadPrefix
        gifString.append(identifier)
        gifString.append(shareSuffix)
        
        let url:URL? = URL(string:gifString)
        
        return url
    }
}
