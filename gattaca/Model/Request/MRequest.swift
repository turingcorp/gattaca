import Foundation

class MRequest
{
    private static let kResourceName:String = "ResourceURL"
    private static let kResourceExtension:String = "plist"
    private static let kTimeout:TimeInterval = 30
    
    class func factorySession() -> URLSession
    {
        let configuration:URLSessionConfiguration = URLSessionConfiguration.ephemeral
        configuration.allowsCellularAccess = true
        configuration.timeoutIntervalForRequest = kTimeout
        configuration.timeoutIntervalForResource = kTimeout
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
}
