import Foundation

extension MFirebaseDatabase
{
    private static let kSlash:String = "/"
    private static let kDot:String = "."
    private static let kEmptyString:String = ""
    
    //MARK: internal
    
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
            
            let path:String = pathComponents.last
            
        else
        {
            return kEmptyString
        }
        
        return path
    }
    
    func modelPath(model:MFirebaseDProtocol) -> String
    {
        var path:String = root
        path.append(MFirebaseDManager.kSlash)
        path.append(model.path)
        
        return path
    }
    
    func modelPath(
        parent:MFirebaseDProtocol?,
        identifier:String?) -> String
    {
        var path:String = root
        
        if let parent:MFirebaseDProtocol = parent
        {
            path.append(MFirebaseDManager.kSlash)
            path.append(parent.path)
        }
        
        if let identifier:String = identifier
        {
            path.append(MFirebaseDManager.kSlash)
            path.append(identifier)
        }
        
        return path
    }
}
