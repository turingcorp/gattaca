import Foundation
import CoreLocation

extension MHomeStrategyAuthLocationStrategy
{
    //MARK: private
    
    private class func factoryMap() -> [CLAuthorizationStatus:MHomeStrategyAuthLocationStrategy.Type]
    {
        let map:[CLAuthorizationStatus:MHomeStrategyAuthLocationStrategy.Type] = [
            CLAuthorizationStatus.authorizedAlways:MHomeStrategyAuthLocationStrategyGranted.self,
            CLAuthorizationStatus.authorizedWhenInUse:MHomeStrategyAuthLocationStrategyGranted.self,
            CLAuthorizationStatus.notDetermined:MHomeStrategyAuthLocationStrategyUnknown.self,
            CLAuthorizationStatus.restricted:MHomeStrategyAuthLocationStrategyDenied.self,
            CLAuthorizationStatus.denied:MHomeStrategyAuthLocationStrategyDenied.self]
        
        return map
    }
    
    //MARK: internal
    
    class func factoryStrategy(
        controller:CHome,
        status:CLAuthorizationStatus) -> MHomeStrategyAuthLocationStrategy?
    {
        let map:[CLAuthorizationStatus:MHomeStrategyAuthLocationStrategy.Type] = factoryMap()
        
        guard
        
            let strategyType:MHomeStrategyAuthLocationStrategy.Type = map[
                status]
        
        else
        {
            return nil
        }
        
        let strategy:MHomeStrategyAuthLocationStrategy = strategyType.init(
            controller:controller)
        
        return strategy
    }
}
