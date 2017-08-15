import Foundation

class FDatabaseUsers:FDatabaseProtocol
{
    var identifier:String? = "users"
    
    init()
    {
    }
    
    required init?(json:Any)
    {
    }
}
