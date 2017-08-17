import Foundation

class FDatabaseCountriesItemUser:FDatabaseProtocol
{
    var identifier:String?
    var parent:FDatabaseProtocol?
    
    init(
        parent:FDatabaseProtocol,
        identifier:String)
    {
        self.parent = parent
        self.identifier = identifier
    }
    
    required init?(json:Any)
    {
        return nil
    }
}
