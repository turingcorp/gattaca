import Foundation

extension MHome
{
    private static let kResourceName:String = "ResourceURL"
    private static let kResourceExtension:String = "plist"
    
    func requestGif()
    {
        
    }
    
    //MARK: private
    
    private class func factoryUrlMap() -> [String:AnyObject]?
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
