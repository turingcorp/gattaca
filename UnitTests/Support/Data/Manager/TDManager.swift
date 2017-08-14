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
    
    func testSave()
    {
        guard
            
            let manager:DManager = DManager()
            
        else
        {
            return
        }
        
        let saveExpectation:XCTestExpectation = expectation(
            description:"core data save")
        
        manager.create(entity:DSession.self)
        { (data:NSManagedObject) in
            
            manager.save
            {
                saveExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            let hasChanges:Bool = manager.managedObjectContext.hasChanges
            
            XCTAssertFalse(
                hasChanges,
                "failed to save core data")
        }
    }
}
