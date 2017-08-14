import Foundation

class MFirebaseDUserItem:MFirebaseDProtocol
{
    let identifier:String?
    
    required init?(snapshot:Any?, identifier:String?)
    {
        self.identifier = identifier
    }
}
