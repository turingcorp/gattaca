import Foundation

extension FDatabase
{
    private static let kSlash:String = "/"
    private static let kDot:String = "."
    private static let kEmptyString:String = ""
    
    //MARK: private
    
    private class func pathFromBundle(bundle:Bundle) -> String
    {
        guard
            
            let rawPath:String = bundle.bundleIdentifier
            
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
        
        let path:String = pathFromBundle(bundle:useBundle)
        
        return path
    }
    
    func modelPath(model:FDatabaseProtocol) -> String
    {
        var path:String = root
        path.append(FDatabase.kSlash)
        path.append(model.path)
        
        return path
    }
    
    func modelPath(
        parent:FDatabaseProtocol?,
        identifier:String?) -> String
    {
        var path:String = root
        
        if let parent:FDatabaseProtocol = parent
        {
            path.append(FDatabase.kSlash)
            path.append(parent.path)
        }
        
        if let identifier:String = identifier
        {
            path.append(FDatabase.kSlash)
            path.append(identifier)
        }
        
        return path
    }
}
