import XCTest
@testable import gattaca

class TMSession:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 15
    
    //MARK: internal
    
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
                session.data,
                "model not loaded")
        }
    }
}
