import Foundation
import CoreLocation

class MHomeStrategyWaitingLocationDelegate:NSObject, CLLocationManagerDelegate
{
    let locationManager:CLLocationManager
    private weak var controller:CHome?
    private let kDistanceFilter:CLLocationDistance = 10
    private let kDistanceAccuracy:CLLocationDistance = 100
    
    init(controller:CHome)
    {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.distanceFilter = kDistanceFilter
        
        super.init()
        
        self.controller = controller
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    deinit
    {
        locationManager.stopUpdatingLocation()
    }
    
    //MARK: locationManagerDelegate
    
    func locationManager(
        _ manager:CLLocationManager,
        didFailWithError error:Error)
    {
        locationManager.stopUpdatingLocation()
        
        VAlert.messageFail(message:error.localizedDescription)
    }
    
    func locationManager(
        _ manager:CLLocationManager,
        didUpdateLocations locations:[CLLocation])
    {
        guard
            
            let currentLocation:CLLocation = locations.last
            
        else
        {
            return
        }
        
        let horizontalAccuracy:CLLocationAccuracy = currentLocation.horizontalAccuracy
        
        if horizontalAccuracy <= kDistanceAccuracy
        {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak self] in
                
            }
        }
    }
}
