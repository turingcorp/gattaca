import Foundation

class MRequest
{
    private static let kGet:String = "GET"
    private static let kResourceName:String = "ResourceURL"
    private static let kResourceExtension:String = "plist"
    
    class func factorySession(timeout:TimeInterval) -> URLSession
    {
        let configuration:URLSessionConfiguration = URLSessionConfiguration.ephemeral
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = timeout
        configuration.timeoutIntervalForResource = timeout
        configuration.isDiscretionary = true
        configuration.networkServiceType = URLRequest.NetworkServiceType.default
        configuration.requestCachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
        
        let session = URLSession(configuration:configuration)
        
        return session
    }
    
    class func factoryUrlMap() -> [String:AnyObject]?
    {
        guard
            
            let resourceUrl:URL = Bundle.main.url(
                forResource:kResourceName,
                withExtension:kResourceExtension),
            let urlDictionary:NSDictionary = NSDictionary(
                contentsOf:resourceUrl)
            
        else
        {
            return nil
        }
        
        let urlMap:[String:AnyObject]? = urlDictionary as? [String:AnyObject]
        
        return urlMap
    }
    
    class func factoryGetRequest(url:URL) -> URLRequest
    {
        var request:URLRequest = URLRequest(
            url:url,
            cachePolicy:
            URLRequest.CachePolicy.reloadIgnoringLocalCacheData,
            timeoutInterval:kTimeout)
        request.httpMethod = kGet
        request.allowsCellularAccess = true
        
        return request
    }
}
