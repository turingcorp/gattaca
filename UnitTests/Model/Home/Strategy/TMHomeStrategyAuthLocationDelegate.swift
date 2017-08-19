import XCTest
import CoreLocation
@testable import gattaca

class TMHomeStrategyAuthLocationDelegate:XCTestCase
{
    private var session:MSession?
    private var controller:CHome?
    private var delegate:MHomeStrategyAuthLocationDelegate?
    private let kCountry:String = "banana republic"
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession()
        self.session = session
        
        let controller:CHome = CHome(session:session)
        self.controller = controller
        
        let strategy:MHomeStrategyAuthLocation = MHomeStrategyAuthLocation(
            controller:controller)
        
        delegate = MHomeStrategyAuthLocationDelegate(
            strategy:strategy)
    }
    
    //MARK: internal
    
    func testLocationManager()
    {
        XCTAssertNotNil(
            delegate?.locationManager,
            "location manager didn't start")
    }
    
    func testNoPlacemarks()
    {
        guard
            
            let delegate:MHomeStrategyAuthLocationDelegate = self.delegate
            
        else
        {
            return
        }
        
        let placeMarks:[CLPlacemark] = []
        let country:String = delegate.countryForPlacemarks(
            placemarks:placeMarks)
        
        XCTAssertEqual(
            country,
            MHomeStrategyAuthLocationDelegate.kUnknownCountry,
            "failed to get country iso")
    }
}
