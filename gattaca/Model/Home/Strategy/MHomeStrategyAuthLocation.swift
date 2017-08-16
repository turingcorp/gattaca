import Foundation
import CoreLocation

class MHomeStrategyAuthLocation:MHomeStrategy
{
    private var strategy:MHomeStrategyAuthLocationStrategy?
    
    override func nextStep()
    {
        let status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        authStatus(status:status)
    }
    
    //MARK: internal
    
    func authStatus(status:CLAuthorizationStatus)
    {
        guard
            
            let controller:CHome = self.controller
        
        else
        {
            return
        }
        
        strategy = MHomeStrategyAuthLocationStrategy.factoryStrategy(
            controller:controller,
            status:status)
        strategy?.nextStep()
    }
}
