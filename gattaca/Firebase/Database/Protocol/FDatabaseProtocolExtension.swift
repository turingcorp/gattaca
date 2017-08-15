import Foundation

extension FDatabaseProtocol
{
    var path:String
    {
        get
        {
            var modelPath:String = ""
            
            if let parent:FDatabaseProtocol = self.parent
            {
                let parentPath:String = parent.path
                modelPath.append(parentPath)
            }
            
            if let identifier:String = self.identifier
            {
                if modelPath.characters.count > 0
                {
                    modelPath.append("/")
                }
                
                modelPath.append(identifier)
            }
            
            return modelPath
        }
    }
    
    var json:Any?
    {
        get
        {
            return nil
        }
    }
}