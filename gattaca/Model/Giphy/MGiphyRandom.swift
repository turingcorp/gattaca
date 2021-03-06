import Foundation

extension MGiphy
{
    private static let kKeyGiphy:String = "giphy"
    private static let kKeyHost:String = "host"
    private static let kKeyRandom:String = "random"
    private static let kKeyVarApiKey:String = "var_api_key"
    private static let kKeyApiKey:String = "api_key"
    private static let kTimeout:TimeInterval = 12
    
    //MARK: internal
    
    class func factoryRandomUrl() -> URL?
    {
        guard
            
            let urlMap:[String:AnyObject] = MRequest.factoryUrlMap(),
            let giphy:[String:AnyObject] = urlMap[kKeyGiphy] as? [String:AnyObject],
            let host:String = giphy[kKeyHost] as? String,
            let random:String = giphy[kKeyRandom] as? String,
            let varApiKey:String = giphy[kKeyVarApiKey] as? String,
            let apiKey:String = giphy[kKeyApiKey] as? String
            
        else
        {
            return nil
        }
        
        var path:String = host
        path.append(random)
        path.append(varApiKey)
        path.append(apiKey)
        
        let url:URL? =  URL(string:path)
        
        return url
    }
    
    class func factoryRandomRequest() -> URLRequest?
    {
        guard
            
            let url:URL = factoryRandomUrl()
            
        else
        {
            return nil
        }
        
        let request:URLRequest = MRequest.factoryGetRequest(
            url:url,
            timeout:kTimeout)
        
        return request
    }
}
