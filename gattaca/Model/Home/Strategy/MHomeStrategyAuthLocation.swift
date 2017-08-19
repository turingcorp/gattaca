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
        strategy = MHomeStrategyAuthLocationStrategy.factoryStrategy(
            parentStrategy:self,
            status:status)
        strategy?.nextStep()
    }
    
    func factoryDelegate()
    {
        delegate = MHomeStrategyAuthLocationDelegate(
            strategy:self)
    }
    
    func syncLocation(
        location:CLLocation,
        country:String)
    {
        let latitude:Double = location.coordinate.latitude
        let longitude:Double = location.coordinate.longitude
        
        controller?.model.syncSessionLocation(
            latitude:latitude,
            longitude:longitude,
            country:country)
        { [weak self] in
            
            self?.locationSynced()
        }
    }
    
    func locationSynced()
    {
        guard
            
            let controller:CHome = self.controller
            
        else
        {
            return
        }
        
        controller.model.status = MHome.Status.ready
        controller.model.loadStrategy(
            controller:controller)
    }
}
