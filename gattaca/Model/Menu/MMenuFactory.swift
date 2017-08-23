import Foundation

extension MMenu
{
    class func factoryItems() -> [MMenuItemProtocol]
    {
        let itemSettings:MMenuItemSettings = MMenuItemSettings()
        let itemMatch:MMenuItemMatch = MMenuItemMatch()
        let itemHome:MMenuItemHome = MMenuItemHome()
        
        let items:[MMenuItemProtocol] = [
            itemSettings,
            itemHome,
            itemMatch]
        
        return items
    }
}
