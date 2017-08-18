import Foundation
import CoreLocation

class CLPlacemarkCountry:CLPlacemark
{
    static let kCountryCode:String = "banana republic"
    
    override var isoCountryCode:String?
    {
        get
        {
            return CLPlacemarkCountry.kCountryCode
        }
    }
}
