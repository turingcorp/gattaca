import Foundation

extension MFirebaseDManager
{
    private static let kSlash:String = "/"
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
        
            let path:String = useBundle.bundleIdentifier
        
        else
        {
            return kEmptyString
        }
        
        var fullPath:String = path
        fullPath.append(kSlash)
        
        return fullPath
    }
}
