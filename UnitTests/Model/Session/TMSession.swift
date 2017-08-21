import XCTest
@testable import gattaca

class TMSession:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 2
    
    //MARK: internal
    
    func testLoad()
    {
        let bundle:Bundle = Bundle(for:TMSession.self)
        
        guard
            
            let coreData:Database = Database(bundle:bundle)
        
        else
        {
            return
        }
        
        let sessionExpectation:XCTestExpectation = expectation(
            description:"session loaded")
        
        let session:MSession = MSession()
        session.load(coreData:coreData)
        {
            sessionExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                session.userId,
                "model not loaded")
        }
    }
}
