import Foundation

class MFirebaseDUserItem:MFirebaseDProtocol
{
    let identifier:String?
    let created:TimeInterval
    let syncstamp:TimeInterval
    let status:Int16
    
    var parent:MFirebaseDProtocol?
    {
        get
        {
            let userList:MFirebaseDUser? = MFirebaseDUser(
                snapshot:nil,
                identifier:nil)
            
            return userList
        }
        
        set
        {
        }
    }
    
    required init?(snapshot:Any?, identifier:String?)
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
