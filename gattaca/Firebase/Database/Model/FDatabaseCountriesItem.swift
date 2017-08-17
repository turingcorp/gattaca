import Foundation

class FDatabaseCountriesItem:FDatabaseProtocol
{
    var identifier:String?
    var parent:FDatabaseProtocol?
    let users:[String]
    
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
