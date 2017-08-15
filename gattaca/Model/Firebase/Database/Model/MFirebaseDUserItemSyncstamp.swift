import Foundation

class MFirebaseDUserItemSyncstamp:MFirebaseDProtocol
{
    var parent:MFirebaseDProtocol?
    var identifier:String? = MFirebaseDUserItem.kKeySyncstamp
    private let syncstamp:TimeInterval
    
    var json:Any?
    {
        get
        {
            return syncstamp
        }
    }
    
    init(parent:MFirebaseDUserItem)
    {
        self.parent = parent
        syncstamp = Date().timeIntervalSince1970
    }
    
    required init?(json:Any)
    {
        return nil
    }
}
