import XCTest
import CoreData
@testable import gattaca

class TDManager:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 2
    
    func testInit()
    {
        let manager:DManager? = DManager()
        
        XCTAssertNotNil(
            manager,
            "failed to instance data manager")
    }
    
    func testCreate()
    {
        guard
        
            let manager:DManager = DManager()
        
        else
        {
            return
        }
        
        let createExpectation:XCTestExpectation = expectation(
            description:"core data create model")
        
        manager.create(entity:DSession.self)
        { (data:NSManagedObject) in
            
            createExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
        }
    }
}
