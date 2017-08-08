import Foundation

extension MGiphy
{
    private static let kKeyData:String = "data"
    private static let kKeyOriginalUrl:String = "image_original_url"
    private static let kKeyFixedHeight:String = "fixed_height"
    
    class func factoryGif(json:Any) -> URLRequest?
    {
        guard
        
            let url:URL = factoryUrl(json:json)
        
        else
        {
            return nil
        }
        
        print(url)
        
        let request:URLRequest = MRequest.factoryGetRequest(url:url)
        
        return request
    }
    
    //MARK: private
    
    private class func factoryUrl(json:Any) -> URL?
    {
        print(json)
        
        guard
        
            let jsonMap:[String:AnyObject] = json as? [String:AnyObject],
            let data:[String:AnyObject] = jsonMap[kKeyData] as? [String:AnyObject],
            let fixedHeight:String = data[kKeyFixedHeight] as? String
        
        else
        {
            return nil
        }
        
        let forcingSsl:String = MRequest.forceSsl(path:fixedHeight)
        let url:URL? = URL(string:forcingSsl)
        
        return url
    }
}
