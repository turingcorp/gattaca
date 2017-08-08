import Foundation

extension MGiphy
{
    private static let kKeyRoot:String = "giphy"
    private static let kKeyHost:String = "host"
    private static let kKeyRandom:String = "random"
    private static let kKeyVarApiKey:String = "var_api_key"
    private static let kKeyApiKey:String = "api_key"
    
    class func factoryRandom() -> URLRequest?
    {
        guard
            
            let url:URL = factoryUrl()
            
        else
        {
            return nil
        }
        
        let request:URLRequest = MRequest.factoryGetRequest(url:url)
        
        return request
    }
    
    //MARK: private
    
    private class func factoryUrl() -> URL?
    {
        guard
            
            let urlMap:[String:AnyObject] = MRequest.factoryUrlMap(),
            let giphyRoot:[String:AnyObject] = urlMap[kKeyRoot] as? [String:AnyObject],
            let host:String = giphyRoot[kKeyHost] as? String,
            let random:String = giphyRoot[kKeyRandom] as? String,
            let varApiKey:String = giphyRoot[kKeyVarApiKey] as? String,
            let apiKey:String = giphyRoot[kKeyApiKey] as? String
            
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
}
