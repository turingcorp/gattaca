import Foundation

class MFirebaseDUserItem:MFirebaseDProtocol
{
    let identifier:String?
    
    var parent:MFirebaseDProtocol?
    {
        get
        {
            let userList:MFirebaseDUser? = MFirebaseDUser(
                snapshot:nil,
                identifier:nil)
            
            return userList
        }
        
        set
        {
        }
    }
    
    required init?(snapshot:Any?, identifier:String?)
    {
        self.identifier = identifier
    }
}
