import XCTest
import CoreLocation
@testable import gattaca

class TMHomeStrategyAuthLocation:XCTestCase
{
    func testAuthStatus()
    {
        let session:MSession = MSession()
        let controller:CHome = CHome(session:session)
        let strategy:MHomeStrategyAuthLocation = MHomeStrategyAuthLocation(
            controller:controller)
        
        strategy.authStatus(status:CLAuthorizationStatus.notDetermined)
        
        XCTAssertNotNil(
            strategy.strategy,
            "failed loading strategy")
    }
}
