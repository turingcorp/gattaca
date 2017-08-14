import Foundation

class MFirebaseDUserItem:MFirebaseDProtocol
{
    static let kKeyCreated:String = "created"
    static let kKeySyncstamp:String = "syncstamp"
    static let kKeyStatus:String = "status"
    
    let identifier:String?
    let created:TimeInterval
    let syncstamp:TimeInterval
    let status:Int16
    
    var parent:MFirebaseDProtocol?
    {
        get
        {
            let userList:MFirebaseDUser? = MFirebaseDUser()
            
            return userList
        }
        
        set
        {
        }
    }
    
    var json:Any?
    {
        get
        {
            let json:[String:Any] = [
                MFirebaseDUserItem.kKeyCreated:created,
                MFirebaseDUserItem.kKeySyncstamp:created,
                MFirebaseDUserItem.kKeyStatus:status,]
            
            return json
        }
    }
    
    required init?(json:Any, identifier:String?)
    {
        return nil
    }
    
    init(session:DSession)
    {
        identifier = nil
        status = session.rawStatus
        
        let currentDate:TimeInterval = Date().timeIntervalSince1970
        created = currentDate
        syncstamp = currentDate
    }
}
