import Foundation

extension FDatabase
{
    private static let kSlash:String = "/"
    private static let kEmptyString:String = ""
    
    //MARK: internal
    
    func modelPath(
        parent:FDatabaseProtocol?,
        identifier:String?) -> String
    {
        var path:String = FDatabase.kEmptyString
        
        if let parent:FDatabaseProtocol = parent
        {
            path.append(parent.path)
        }
        
        if let identifier:String = identifier
        {
            if path.characters.count > 0
            {
                path.append(FDatabase.kSlash)
            }
            
            path.append(identifier)
        }
        
        return path
    }
}
