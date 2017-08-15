import XCTest
@testable import gattaca

class TMSession:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 10
    
    func testLoad()
    {
        let sessionExpectation:XCTestExpectation = expectation(
            description:"session loaded")
        
        let session:MSession = MSession()
        session.load
        {
            sessionExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                session.session,
                "model not loaded")
        }
    }
}
