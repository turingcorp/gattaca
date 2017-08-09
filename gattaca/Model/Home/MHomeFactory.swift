import Foundation

extension MHome
{
    class func factoryActions() -> [MHomeActionProtocol]
    {
        let itemHate:MHomeActionHate = MHomeActionHate()
        let itemMeh:MHomeActionMeh = MHomeActionMeh()
        let itemLike:MHomeActionLike = MHomeActionLike()
        
        let items:[MHomeActionProtocol] = [
            itemHate,
            itemMeh,
            itemLike]
        
        return items
    }
}
