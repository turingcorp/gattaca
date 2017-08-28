import Foundation

extension MProfileEdit
{
    class func factoryItems() -> [MProfileEditItemProtocol]
    {
        let itemPictures:MProfileEditItemPictures = MProfileEditItemPictures()
        let itemName:MProfileEditItemName = MProfileEditItemName()
        
        let items:[MProfileEditItemProtocol] = [
            itemPictures,
            itemName]
        
        return items
    }
}
