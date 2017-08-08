import Foundation

extension MGiphy
{
    private static let kKeyData:String = "data"
    private static let kKeyOriginalUrl:String = "image_original_url"
    
    class func factoryGif(json:Any) -> URLRequest?
    {
        guard
        
            let url:URL = factoryUrl(json:json)
        
        else
        {
            return nil
        }
        
        let request:URLRequest = MRequest.factoryGetRequest(url:url)
        
        return request
    }
    
    //MARK: private
    
    private class func factoryUrl(json:Any) -> URL?
    {
        guard
        
            let jsonMap:[String:AnyObject] = json as? [String:AnyObject],
            let data:[String:AnyObject] = jsonMap[kKeyData] as? [String:AnyObject],
            let originalUrl:String = data[kKeyOriginalUrl] as? String
        
        else
        {
            return nil
        }
        
        let url:URL? = URL(string:originalUrl)
        
        return url
    }
}
