import Foundation

extension MMenu
{
    class func factoryItems() -> [MMenuItemProtocol]
    {
        let itemMatch:MMenuItemMatch = MMenuItemMatch()
        let itemHome:MMenuItemHome = MMenuItemHome()
        
        let items:[MMenuItemProtocol] = [
            itemHome,
            itemMatch]
        
        return items
    }
}
