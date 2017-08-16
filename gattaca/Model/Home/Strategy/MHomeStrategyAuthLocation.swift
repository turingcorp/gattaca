import Foundation
import CoreLocation

class MHomeStrategyAuthLocation:MHomeStrategy
{
    override func nextStep()
    {
        let status:CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        authStatus(status:status)
    }
    
    //MARK: internal
    
    func authStatus(status:CLAuthorizationStatus)
    {
        
    }
}
