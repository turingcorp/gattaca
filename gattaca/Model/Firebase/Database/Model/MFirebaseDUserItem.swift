import Foundation

class MFirebaseDUserItem:MFirebaseDProtocol
{
    let identifier:String
    
    required init?(snapshot:Any, identifier:String?)
    {
        guard
        
            let identifier:String = identifier
        
        else
        {
            return nil
        }
        
        self.identifier = identifier
    }
}
