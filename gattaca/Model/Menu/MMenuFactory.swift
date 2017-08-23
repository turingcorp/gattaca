import Foundation

extension MMenu
{
    //MARK: private
    
    private class func factoryOrderMap() -> [MMenu.Order:MMenuItemProtocol.Type]
    {
        let map:[MMenu.Order:MMenuItemProtocol.Type] = [
            MMenu.Order.settings:MMenuItemSettings.self,
            MMenu.Order.home:MMenuItemHome.self,
            MMenu.Order.match:MMenuItemMatch.self]
        
        return map
    }
    
    //MARK: internal
    
    class func factoryItems() -> [MMenuItemProtocol]
    {
        var items:[MMenuItemProtocol] = []
        let map:[MMenu.Order:MMenuItemProtocol.Type] = factoryOrderMap()
        
        for mapItem:(key:MMenu.Order, value:MMenuItemProtocol.Type) in map
        {
            let order:MMenu.Order = mapItem.key
            let itemType:MMenuItemProtocol.Type = mapItem.value
            let item:MMenuItemProtocol = itemType.init(order:order)
            items.append(item)
        }
        
        items.sort
        { (itemA:MMenuItemProtocol, itemB:MMenuItemProtocol) -> Bool in
            
            return itemA.order.rawValue < itemB.order.rawValue
        }
        
        return items
    }
}
