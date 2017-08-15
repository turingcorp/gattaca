import Foundation

class FDatabaseUsersItemSyncstamp:FDatabaseProtocol
{
    var parent:FDatabaseProtocol?
    var identifier:String? = FDatabaseUsersItem.kKeySyncstamp
    private let syncstamp:TimeInterval
    
    var json:Any?
    {
        get
        {
            return syncstamp
        }
    }
    
    init(parent:FDatabaseUsersItem)
    {
        self.parent = parent
        syncstamp = Date().timeIntervalSince1970
    }
    
    required init?(json:Any)
    {
        return nil
    }
}
