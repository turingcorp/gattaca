import Foundation

class MFirebaseDUserItemSyncstamp:MFirebaseDProtocol
{
    let identifier:String? = MFirebaseDUserItem.kKeySyncstamp
    
    required init?(json:Any, identifier:String?)
    {
        return nil
    }
    
    init(userItem:MFirebaseDUserItem)
    {
        self.parent = userItem
    }
}
