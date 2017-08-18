import XCTest
@testable import gattaca

class TMHomeStrategyWaitingLocation:XCTestCase
{
    private let kAsyncWait:TimeInterval = 1
    private let kWaitExpectation:TimeInterval = 2
    
    func testDelegate()
    {
        let session:MSession = MSession()
        let controller:CHome = CHome(session:session)
        let strategy:MHomeStrategyWaitingLocation = MHomeStrategyWaitingLocation(
            controller:controller)
        
        XCTAssertNil(
            strategy.delegate,
            "delegate should be nil")
        
        let delegateExpectation:XCTestExpectation = expectation(
            description:"load delegate")
        
        strategy.nextStep()
        
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
