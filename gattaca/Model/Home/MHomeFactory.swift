import Foundation

extension MHome
{
    class func factoryActions() -> [MHomeActionProtocol]
    {
        let itemMeh:MHomeActionMeh = MHomeActionMeh()
        
        let items:[MHomeActionProtocol] = [
            itemMeh]
        
        return items
    }
}
