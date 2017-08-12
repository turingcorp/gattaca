import Foundation

extension MHomeStrategy
{
    class func factoryStrategy(controller:CHome) -> MHomeStrategy?
    {
        let map:[MSession.Status:MHomeStrategy.Type] = strategyMap()
        let currentStatus:MSession.Status = MSession.sharedInstance.status
        
        guard
        
            let strategyType:MHomeStrategy.Type = map[currentStatus]
        
        else
        {
            return nil
        }
        
        let strategy:MHomeStrategy = strategyType.init(
            controller:controller)
        
        return strategy
    }
    
    //MARK: private
    
    private class func strategyMap() -> [MSession.Status:MHomeStrategy.Type]
    {
        let map:[MSession.Status:MHomeStrategy.Type] = [:]
        
        return map
    }
}
