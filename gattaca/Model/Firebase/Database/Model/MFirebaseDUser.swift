import Foundation

class MFirebaseDUser:MFirebaseDProtocol
{
    private let kIdentifier:String = "user"
    
    static var parent:MFirebaseDProtocol.Type?
    {
        get
        {
            return nil
        }
    }
    
    var identifier:String
    {
        get
        {
            return kIdentifier
        }
    }
    
    var json:Any?
    {
        get
        {
            return nil
        }
    }
    
    required init?(snapshot:Any)
    {
    }
}
