import Foundation

class MFirebaseDUserItemSyncstamp:MFirebaseDProtocol
{
    let identifier:String? = MFirebaseDUserItem.kKeySyncstamp
    private(set) var parent:MFirebaseDProtocol?
    
    init(userItem:MFirebaseDUserItem)
    {
        parent = userItem
    }
    
    required init?(json:Any, identifier:String?)
    {
        return nil
    }
}
