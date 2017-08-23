import Foundation

class MMenu
{
    let items:[MMenuItemProtocol]
    
    init()
    {
        items = MMenu.factoryItems()
    }
}
