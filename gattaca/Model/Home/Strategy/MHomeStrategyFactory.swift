import Foundation

extension MHomeStrategy
{
    //MARK: private
    
    private class func strategyMap() -> [MSession.Status:MHomeStrategy.Type]
    {
        let map:[MSession.Status:MHomeStrategy.Type] = [
            MSession.Status.new:MHomeStrategyNew.self,
            MSession.Status.loading:MHomeStrategyLoading.self,
            MSession.Status.sync:MHomeStrategySync.self,
            MSession.Status.loaded:MHomeStrategyLoaded.self,
            MSession.Status.authLocation:MHomeStrategyAuthLocation.self,
            MSession.Status.waitingLocation:MHomeStrategyWaitingLocation.self,
            MSession.Status.syncLocation:MHomeStrategySyncLocation.self,
            MSession.Status.ready:MHomeStrategyReady.self]
        
        return map
    }
    
    //MARK: internal
    
    class func factoryStrategy(controller:CHome) -> MHomeStrategy?
    {
         let map:[MSession.Status:MHomeStrategy.Type] = strategyMap()
         let currentStatus:MSession.Status = controller.model.session.status
         
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
