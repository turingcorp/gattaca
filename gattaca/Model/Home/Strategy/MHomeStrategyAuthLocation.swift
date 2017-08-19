import Foundation
import CoreLocation

class MHomeStrategyAuthLocation:MHomeStrategy
{
    private(set) var strategy:MHomeStrategyAuthLocationStrategy?
    private(set) var delegate:MHomeStrategyAuthLocationDelegate?
    
    deinit
    {
        delegate?.locationManager?.stopUpdatingLocation()
        delegate?.locationManager?.delegate = nil
    }
    
    override func controllerDidAppear(controller:CHome)
    {
        super.controllerDidAppear(controller:controller)
        
        controller.model.authLocation(controller:controller)
    }
    
    override func nextStep()
    {
        super.nextStep()
        
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
            parentStrategy:self,
            status:status)
        strategy?.nextStep()
    }
    
    func factoryDelegate()
    {
        guard
            
            let controller:CHome = self.controller
            
        else
        {
            return
        }
        
        delegate = MHomeStrategyAuthLocationDelegate(
            controller:controller)
    }
}
