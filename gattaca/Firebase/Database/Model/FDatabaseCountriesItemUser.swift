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
    
    init(
        parent:FDatabaseProtocol,
        identifier:String,
        latitude:Double,
        longitude:Double)
    {
        self.parent = parent
        self.identifier = identifier
        self.latitude = latitude
        self.longitude = longitude
        syncstamp = Date().timeIntervalSince1970
    }
    
    required init?(json:Any)
    {
        return nil
    }
}
