import Foundation

class MHomeGiphyUrl
{
    private static let kKeyRoot:String = "giphy"
    private static let kKeyHost:String = "host"
    private static let kKeyRandom:String = "random"
    
    class func factoryRandom() -> URL?
    {
        guard
        
            let urlMap:[String:AnyObject] = MHome.factoryUrlMap(),
            let giphyRoot:[String:AnyObject] = urlMap[kKeyRoot] as? [String:AnyObject],
            let host:String = giphyRoot[kKeyHost] as? String,
            let random:String = giphyRoot[kKeyRandom] as? String
        
        else
        {
            return nil
        }
        
        let pathString:String = "\(host)\(random)"
        
        guard
        
            let url:URL = URL(string:pathString)
        
        else
        {
            return nil
        }
        
        return url
    }
}
