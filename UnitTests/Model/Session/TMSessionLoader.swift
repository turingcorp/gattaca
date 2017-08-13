import XCTest
@testable import gattaca

class TMSessionLoader:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 3
    
    func testCreate()
    {
        let sessionExpectation:XCTestExpectation = expectation(
            description:"session created")
        
        guard
            
            let manager:DManager = DManager()
        
        else
        {
            return
        }
        
        XCTAssertNotNil(
            manager,
            "failed creating manager")
        
        let session:MSession = MSession()
        session.create(manager:manager)
        { (session:DSession) in
            
            sessionExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            let hasChanges:Bool = manager.managedObjectContext.hasChanges
            
            XCTAssertFalse(
                hasChanges,
                "failed to save changes")
        }
    }
}
