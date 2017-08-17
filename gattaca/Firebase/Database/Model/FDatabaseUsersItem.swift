import Foundation

class FDatabaseUsersItem:FDatabaseProtocol
{
    static let kKeyCreated:String = "created"
    static let kKeySyncstamp:String = "syncstamp"
    static let kKeyStatus:String = "status"
    static let kKeyLocation:String = "location"
    
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
            let json:[String:Any] = [
                FDatabaseUsersItem.kKeyCreated:created,
                FDatabaseUsersItem.kKeySyncstamp:syncstamp,
                FDatabaseUsersItem.kKeyStatus:status]
            
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
        
        self.created = created
        self.syncstamp = syncstamp
        self.status = status
    }
}
