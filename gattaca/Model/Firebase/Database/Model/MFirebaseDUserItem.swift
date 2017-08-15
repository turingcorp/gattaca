import Foundation

class MFirebaseDUserItem:MFirebaseDProtocol
{
    static let kKeyCreated:String = "created"
    static let kKeySyncstamp:String = "syncstamp"
    static let kKeyStatus:String = "status"
    
    var identifier:String?
    let created:TimeInterval
    let syncstamp:TimeInterval
    let status:Int16
    private(set) weak var parent:MFirebaseDUser?
    
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
    
    init(parent:MFirebaseDUser, session:DSession)
    {
        self.parent = parent
        status = session.rawStatus
        
        let currentDate:TimeInterval = Date().timeIntervalSince1970
        created = currentDate
        syncstamp = currentDate
    }
    
    required init?(json:Any)
    {
        return nil
    }
}
