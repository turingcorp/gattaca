import XCTest
import CoreLocation
@testable import gattaca

class TMHomeStrategyWaitingLocationDelegate:XCTestCase
{
    private var session:MSession?
    private var controller:CHome?
    private var delegate:MHomeStrategyWaitingLocationDelegate?
    private let kCountry:String = "banana republic"
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession()
        self.session = session
        
        let controller:CHome = CHome(session:session)
        self.controller = controller
        
        delegate = MHomeStrategyWaitingLocationDelegate(
            controller:controller)
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
        
            let delegate:MHomeStrategyWaitingLocationDelegate = self.delegate
        
        else
        {
            return
        }
        
        let placeMarks:[CLPlacemark] = []
        let country:String = delegate.countryForPlacemarks(
            placemarks:placeMarks)
        
        XCTAssertEqual(
            country,
            MHomeStrategyWaitingLocationDelegate.kUnknownCountry,
            "failed to get country iso")
    }
}
