import Foundation

extension MProfileEdit
{
    class func factoryItems() -> [MProfileEditItemProtocol]
    {
        let itemPictures:MProfileEditItemPictures = MProfileEditItemPictures()
        let itemName:MProfileEditItemName = MProfileEditItemName()
        let itemAge:MProfileEditItemAge = MProfileEditItemAge()
        
        let items:[MProfileEditItemProtocol] = [
            itemPictures,
            itemName,
            itemAge]
        
        return items
    }
}
