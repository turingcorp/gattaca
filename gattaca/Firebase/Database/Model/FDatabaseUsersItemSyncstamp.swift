import Foundation

class FDatabaseUsersItemSyncstamp:FDatabaseProtocol
{
    var parent:FDatabaseProtocol?
    var identifier:String? = FDatabaseUsersItem.kKeySyncstamp
    var syncstamp:TimeInterval
    
    var json:Any?
    {
        get
        {
            return syncstamp
        }
    }
    
    init?(user:FDatabaseUsersItem)
    {
        if user.identifier == nil
        {
            return nil
        }
        
        parent = user
        syncstamp = Date().timeIntervalSince1970
    }
    
    required init?(json:Any)
    {
        return nil
    }
}
