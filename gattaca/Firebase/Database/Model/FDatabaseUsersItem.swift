import Foundation

class FDatabaseUsersItem:FDatabaseProtocol
{
    static let kKeyCreated:String = "created"
    static let kKeySyncstamp:String = "syncstamp"
    static let kKeyStatus:String = "status"
    static let kKeyCountry:String = "country"
    
    var identifier:String?
    var parent:FDatabaseProtocol?
    var country:String?
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
        
        self.created = created
        self.syncstamp = syncstamp
        self.status = status
    }
}
