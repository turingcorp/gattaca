import Foundation

extension MMenu
{
    class func factoryItems() -> [MMenuItemProtocol]
    {
        let itemMatch:MMenuItemMatch = MMenuItemMatch()
        
        let items:[MMenuItemProtocol] = [
            itemMatch]
        
        return items
    }
}
