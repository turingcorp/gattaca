import Foundation

class FDatabaseUsersItem:FDatabaseProtocol
{
    static let kKeyCreated:String = "created"
    static let kKeySyncstamp:String = "syncstamp"
    static let kKeyStatus:String = "status"
    
    var identifier:String?
    var parent:FDatabaseProtocol?
    let created:TimeInterval
    let syncstamp:TimeInterval
    let status:Int16
    
    var json:Any?
    {
        get
        {
            let json:[String:Any] = [
                FDatabaseUsersItem.kKeyCreated:created,
                FDatabaseUsersItem.kKeySyncstamp:created,
                FDatabaseUsersItem.kKeyStatus:status,]
            
            return json
        }
    }
    
    init(users:FDatabaseUsers, session:DSession)
    {
        parent = users
        status = session.rawStatus
        
        let currentDate:TimeInterval = Date().timeIntervalSince1970
        created = currentDate
        syncstamp = currentDate
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
