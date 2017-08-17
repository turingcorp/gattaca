import Foundation

class FDatabaseCountriesItem:FDatabaseProtocol
{
    var identifier:String?
    var parent:FDatabaseProtocol?
    let users:[String]
    
    init(identifier:String)
    {
        self.identifier = identifier
    }
    
    required init?(json:Any)
    {
        guard
            
            let users:[String] = json as? [String]
            
        else
        {
            return nil
        }
        
        self.users = users
    }
}
