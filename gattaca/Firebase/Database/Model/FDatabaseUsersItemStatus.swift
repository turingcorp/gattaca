import Foundation

class FDatabaseUsersItemStatus:FDatabaseProtocol
{
    var parent:FDatabaseProtocol?
    var identifier:String? = FDatabaseUsersItem.kKeyStatus
    var rawStatus:Int16
    
    var status:DSession.Status
    {
        get
        {
            guard
            
                let status:DSession.Status = DSession.Status(
                    rawValue:rawStatus)
            
            else
            {
                return DSession.Status.banned
            }
            
            return status
        }
        
        set
        {
            rawStatus = newValue.rawValue
        }
    }
    
    var json:Any?
    {
        get
        {
            return rawStatus
        }
    }
    
    init(user:FDatabaseUsersItem)
    {
        parent = user
        rawStatus = user.status
    }
    
    required init?(json:Any)
    {
        return nil
    }
}
