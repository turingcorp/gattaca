import Foundation

class MFirebaseDUser:MFirebaseDProtocol
{
    private let kIdentifier:String = "user"
    
    var identifier:String
    {
        get
        {
            return kIdentifier
        }
    }
    
    required init?(snapshot:Any)
    {
    }
}
