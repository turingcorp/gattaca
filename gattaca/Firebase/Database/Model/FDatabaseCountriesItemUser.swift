import Foundation

class FDatabaseCountriesItemUser:FDatabaseProtocol
{
    static let kKeyLatitude:String = "latitude"
    static let kKeyLongitude:String = "longitude"
    static let kKeySyncstamp:String = "syncstamp"
    
    var identifier:String?
    var parent:FDatabaseProtocol?
    let latitude:Double
    let longitude:Double
    let syncstamp:TimeInterval
    
    var json:Any?
    {
        get
        {
            let json:[String:Any] = [
                FDatabaseCountriesItemUser.kKeyLatitude:latitude,
                FDatabaseCountriesItemUser.kKeyLongitude:longitude,
                FDatabaseCountriesItemUser.kKeySyncstamp:syncstamp]
            
            return json
        }
    }
    
    init?(
        country:FDatabaseCountriesItem,
        identifier:String,
        latitude:Double,
        longitude:Double)
    {
        if country.identifier == nil
        {
            return nil
        }
        
        self.identifier = identifier
        self.latitude = latitude
        self.longitude = longitude
        self.parent = country
        syncstamp = Date().timeIntervalSince1970
    }
    
    required init?(json:Any)
    {
        return nil
    }
}
