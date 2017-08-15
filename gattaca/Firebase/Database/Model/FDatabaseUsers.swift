import Foundation

class FDatabaseUsers:FDatabaseProtocol
{
    var identifier:String? = "users"
    var parent:FDatabaseProtocol?
    
    init()
    {
    }
    
    required init?(json:Any)
    {
    }
}
