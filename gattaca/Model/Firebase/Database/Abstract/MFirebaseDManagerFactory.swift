import Foundation

extension MFirebaseDManager
{
    private static let kSlash:String = "/"
    private static let kDot:String = "."
    private static let kEmptyString:String = ""
    
    class func factoryRoot(bundle:Bundle?) -> String
    {
        let useBundle:Bundle
        
        if let bundle:Bundle = bundle
        {
            useBundle = bundle
        }
        else
        {
            useBundle = Bundle.main
        }
        
        guard
        
            let rawPath:String = useBundle.bundleIdentifier
        
        else
        {
            return kEmptyString
        }
        
        let pathComponents:[String] = rawPath.components(
            separatedBy:kDot)
        
        guard
            
            var path:String = pathComponents.last
        
        else
        {
            return kEmptyString
        }
        
        path.append(kSlash)
        
        return path
    }
}
