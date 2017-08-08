import Foundation

extension MGiphy
{
    private static let kKeyData:String = "data"
    private static let kKeyMp4Url:String = "image_mp4_url"
    
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
            let urlMp4:String = data[kKeyMp4Url] as? String
        
        else
        {
            return nil
        }
        
        let forcingSsl:String = MRequest.forceSsl(path:urlMp4)
        let url:URL? = URL(string:forcingSsl)
        
        return url
    }
}
