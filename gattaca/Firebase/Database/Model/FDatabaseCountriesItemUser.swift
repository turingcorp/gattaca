import Foundation

class FDatabaseCountriesItemUser:FDatabaseProtocol
{
    static let kKeyLatitude:String = "latitude"
    static let kKeyLongitude:String = "longitude"
    
    var identifier:String?
    var parent:FDatabaseProtocol?
    let latitude:Double
    let longitude:Double
    
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
    }
    
    required init?(json:Any)
    {
        return nil
    }
}
