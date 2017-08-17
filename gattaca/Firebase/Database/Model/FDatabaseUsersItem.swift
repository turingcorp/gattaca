import Foundation

class FDatabaseUsersItem:FDatabaseProtocol
{
    static let kKeyCreated:String = "created"
    static let kKeySyncstamp:String = "syncstamp"
    static let kKeyStatus:String = "status"
    static let kKeyCountry:String = "country"
    static let kKeyLatitude:String = "latitude"
    static let kKeyLongitude:String = "longitude"
    
    var identifier:String?
    var parent:FDatabaseProtocol?
    var country:String?
    var latitude:Double?
    var longitude:Double?
    let created:TimeInterval
    let syncstamp:TimeInterval
    let status:Int16
    
    var json:Any?
    {
        get
        {
            var json:[String:Any] = [
                FDatabaseUsersItem.kKeyCreated:created,
                FDatabaseUsersItem.kKeySyncstamp:syncstamp,
                FDatabaseUsersItem.kKeyStatus:status]
            
            if let country:String = self.country
            {
                json[FDatabaseUsersItem.kKeyCountry] = country
            }
            
            if let latitude:Double = self.latitude
            {
                json[FDatabaseUsersItem.kKeyLatitude] = latitude
            }
            
            if let longitude:Double = self.longitude
            {
                json[FDatabaseUsersItem.kKeyLongitude] = longitude
            }
            
            return json
        }
    }
    
    init(users:FDatabaseUsers)
    {
        let currentDate:TimeInterval = Date().timeIntervalSince1970
        created = currentDate
        syncstamp = currentDate
        status = DSession.Status.active.rawValue
        parent = users
    }
    
    required init?(json:Any)
    {
        guard
            
            let jsonMap:[String:Any] = json as? [String:Any],
            let created:TimeInterval = jsonMap[
                FDatabaseUsersItem.kKeyCreated] as? TimeInterval,
            let syncstamp:TimeInterval = jsonMap[
                FDatabaseUsersItem.kKeySyncstamp] as? TimeInterval,
            let status:Int16 = jsonMap[
                FDatabaseUsersItem.kKeyStatus] as? Int16
            
        else
        {
            return nil
        }
        
        country = jsonMap[FDatabaseUsersItem.kKeyCountry] as? String
        latitude = jsonMap[FDatabaseUsersItem.kKeyLatitude] as? Double
        longitude = jsonMap[FDatabaseUsersItem.kKeyLongitude] as? Double
        
        self.created = created
        self.syncstamp = syncstamp
        self.status = status
    }
}
