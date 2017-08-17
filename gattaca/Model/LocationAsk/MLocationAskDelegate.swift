import Foundation
import CoreLocation

class MLocationAskDelegate:NSObject, CLLocationManagerDelegate
{
    var locationManager:CLLocationManager?
    private weak var controller:CLocationAsk?
    private let kDistanceFilter:CLLocationDistance = 1000
    
    //MARK: internal
    
    func askLocation(controller:CLocationAsk)
    {
        self.controller = controller
        
        let locationManager:CLLocationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.distanceFilter = kDistanceFilter
        locationManager.delegate = self
        self.locationManager = locationManager
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    //MARK: locationManagerDelegate
    
    func locationManager(
        _ manager:CLLocationManager,
        didChangeAuthorization status:CLAuthorizationStatus)
    {
        if status != CLAuthorizationStatus.notDetermined
        {
            DispatchQueue.main.async
            { [weak self] in
                
                self?.controller?.authorizationChanged()
            }
        }
    }
}
