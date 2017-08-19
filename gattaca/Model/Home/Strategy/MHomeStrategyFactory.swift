import Foundation

extension MHomeStrategy
{
    //MARK: private
    
    private class func strategyMap() -> [MHome.Status:MHomeStrategy.Type]
    {
        let map:[MHome.Status:MHomeStrategy.Type] = [
            MHome.Status.new:MHomeStrategyNew.self,
            MHome.Status.authLocation:MHomeStrategyAuthLocation.self,
            MHome.Status.ready:MHomeStrategyReady.self]
        
        return map
    }
    
    //MARK: internal
    
    class func factoryStrategy(controller:CHome) -> MHomeStrategy?
    {
         let map:[MHome.Status:MHomeStrategy.Type] = strategyMap()
         let currentStatus:MHome.Status = controller.model.status
         
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
}
