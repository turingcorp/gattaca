import Foundation

extension MGiphy
{
    private static let kKeyGiphy:String = "giphy"
    private static let kKeyHost:String = "host"
    private static let kKeyTrending:String = "trending"
    private static let kKeyVarLimit:String = "var_limit"
    private static let kKeyVarOffset:String = "var_offset"
    private static let kKeyVarApiKey:String = "var_api_key"
    private static let kKeyApiKey:String = "api_key"
    private static let kTimeout:TimeInterval = 12
    
    class func factoryTrendingRequest(
        offset:Int,
        limit:Int) -> URLRequest?
    {
        guard
            
            let url:URL = factoryUrl(
                offset:offset,
                limit:limit)
            
        else
        {
            return nil
        }
        
        let request:URLRequest = MRequest.factoryGetRequest(
            url:url,
            timeout:kTimeout)
        
        return request
    }
    
    //MARK: private
    
    private class func factoryUrl(
        offset:Int,
        limit:Int) -> URL?
    {
        guard
            
            let urlMap:[String:AnyObject] = MRequest.factoryUrlMap(),
            let giphy:[String:AnyObject] = urlMap[kKeyGiphy] as? [String:AnyObject],
            let host:String = giphy[kKeyHost] as? String,
            let trending:String = giphy[kKeyTrending] as? String,
            let varLimit:String = giphy[kKeyVarLimit] as? String,
            let varOffset:String = giphy[kKeyVarOffset] as? String,
            let varApiKey:String = giphy[kKeyVarApiKey] as? String,
            let apiKey:String = giphy[kKeyApiKey] as? String
            
        else
        {
            return nil
        }
        
        let limitString:String = "\(limit)"
        let offsetString:String = "\(offset)"
        
        var path:String = host
        path.append(trending)
        path.append(varLimit)
        path.append(limitString)
        path.append(varOffset)
        path.append(offsetString)
        path.append(varApiKey)
        path.append(apiKey)
        
        let url:URL? =  URL(string:path)
        
        return url
    }
}
