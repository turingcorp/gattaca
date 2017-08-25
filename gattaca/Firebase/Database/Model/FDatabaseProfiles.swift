import Foundation

class FDatabaseProfiles:FDatabaseProtocol
{
    var identifier:String? = "profiles"
    var parent:FDatabaseProtocol?
    
    init()
    {
    }
    
    required init?(json:Any)
    {
    }
}
