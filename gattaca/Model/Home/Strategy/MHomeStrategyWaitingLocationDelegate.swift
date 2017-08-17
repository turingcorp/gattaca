import Foundation
import CoreLocation

class MHomeStrategyWaitingLocationDelegate:NSObject, CLLocationManagerDelegate
{
    let locationManager:CLLocationManager
    private weak var controller:CHome?
    private weak var geocoder:CLGeocoder?
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
        geocoder?.cancelGeocode()
        locationManager.stopUpdatingLocation()
    }
    
    //MARK: private
    
    private func showError(message:String)
    {
        locationManager.stopUpdatingLocation()
        locationManager.delegate = nil
        
        VAlert.messageFail(message:message)
    }
    
    private func reverseGeocode(location:CLLocation)
    {
        let geocoder:CLGeocoder = CLGeocoder()
        self.geocoder = geocoder
        
        geocoder.reverseGeocodeLocation(location)
        { [weak self] (placemarks:[CLPlacemark]?, error:Error?) in
            
            if let error:Error = error
            {
                self?.showError(message:error.localizedDescription)
            }
            
            guard
            
                let placemark:CLPlacemark = placemarks?.last,
                let country:String = placemark.isoCountryCode?.lowercased()
            
            else
            {
                return
            }
            
            print(country)
        }
    }
    
    private func syncLocation(
        location:CLLocation)
    {
        let latitude:Double = location.coordinate.latitude
        let longitude:Double = location.coordinate.longitude
        
        controller?.model.session.syncLocation(
            latitude:latitude,
            longitude:longitude)
        { [weak self] in
            
            guard
                
                let controller:CHome = self?.controller
            
            
            else
            {
                return
            }
            
            controller.model.loadStrategy(
                controller:controller)
        }
    }
    
    //MARK: locationManagerDelegate
    
    func locationManager(
        _ manager:CLLocationManager,
        didFailWithError error:Error)
    {
        showError(message:error.localizedDescription)
    }
    
    func locationManager(
        _ manager:CLLocationManager,
        didUpdateLocations locations:[CLLocation])
    {
        guard
            
            let location:CLLocation = locations.last
            
        else
        {
            return
        }
        
        let horizontalAccuracy:CLLocationAccuracy = location.horizontalAccuracy
        
        if horizontalAccuracy <= kDistanceAccuracy
        {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak self] in
                
                self?.reverseGeocode(location:location)
            }
        }
    }
}