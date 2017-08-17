import Foundation

class FDatabaseUsersItemLocation:FDatabaseProtocol
{
    static let kKeyCountry:String = "country"
    static let kKeyLatitude:String = "latitude"
    static let kKeyLongitude:String = "longitude"
    
    var parent:FDatabaseProtocol?
    var identifier:String? = FDatabaseUsersItem.kKeyLocation
    let country:String
    let latitude:Double
    let longitude:Double
    
    var json:Any?
    {
        get
        {
            let json:[String:Any] = [
                FDatabaseUsersItemLocation.kKeyCountry:country,
                FDatabaseUsersItemLocation.kKeyLatitude:latitude,
                FDatabaseUsersItemLocation.kKeyLongitude:longitude]
            
            return json
        }
    }
    
    init?(
        user:FDatabaseUsersItem,
        country:String,
        latitude:Double,
        longitude:Double)
    {
        if user.identifier == nil
        {
            return nil
        }
        
        parent = user
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
    }
    
    required init?(json:Any)
    {
        return nil
    }
}
