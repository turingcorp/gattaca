import Foundation

class FDatabaseUsersItemLocation:FDatabaseProtocol
{
    static let kKeyCountry:String = "country"
    
    var parent:FDatabaseProtocol?
    var identifier:String? = FDatabaseUsersItem.kKeyLocation
    let country:String
    
    var json:Any?
    {
        get
        {
            let json:[String:Any] = [
                FDatabaseUsersItemLocation.kKeyCountry:country]
            
            return json
        }
    }
    
    init?(
        user:FDatabaseUsersItem,
        country:String,)
    {
        if user.identifier == nil
        {
            return nil
        }
        
        parent = user
        self.country = country
    }
    
    required init?(json:Any)
    {
        return nil
    }
}
