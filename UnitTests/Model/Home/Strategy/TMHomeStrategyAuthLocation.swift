import XCTest
import CoreLocation
@testable import gattaca

class TMHomeStrategyAuthLocation:XCTestCase
{
    private let kAsyncWait:TimeInterval = 1
    private let kWaitExpectation:TimeInterval = 2
    
    //MARK: internal
    
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
    
    func testDelegate()
    {
        let session:MSession = MSession()
        let controller:CHome = CHome(session:session)
        let strategy:MHomeStrategyAuthLocation = MHomeStrategyAuthLocation(
            controller:controller)
        
        XCTAssertNil(
            strategy.delegate,
            "delegate should be nil")
        
        let delegateExpectation:XCTestExpectation = expectation(
            description:"load delegate")
        
        strategy.factoryDelegate()
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kAsyncWait)
        {
            delegateExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                strategy.delegate,
                "delegate not loaded")
        }
    }
}
