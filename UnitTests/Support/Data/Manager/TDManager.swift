import XCTest
import CoreData
@testable import gattaca

class TDManager:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 2
    
    func testDifferentCoordinators()
    {
        let currentBundle:Bundle = Bundle(for:TDManager.self)
        
        guard
        
            let managerProduction:DManager = DManager(bundle:nil),
            let managerTests:DManager = DManager(bundle:currentBundle)
        
        else
        {
            return
        }
        
        let pathProduction:String? = managerProduction.managedObjectContext.persistentStoreCoordinator?.persistentStores.first?.url?.path
        let pathTests:String? = managerTests.managedObjectContext.persistentStoreCoordinator?.persistentStores.first?.url?.path
        
        XCTAssertNotNil(
            pathProduction,
            "failed loading production store path")
        
        XCTAssertNotNil(
            pathTests,
            "failed loading tests store path")
        
        XCTAssertNotEqual(
            pathProduction,
            pathTests,
            "store coordinators for production and test should be different")
    }
    
    func testInit()
    {
        let currentBundle:Bundle = Bundle(for:TDManager.self)
        
        let manager:DManager? = DManager(bundle:currentBundle)
        
        XCTAssertNotNil(
            manager,
            "failed to instance data manager")
    }
    
    func testCreate()
    {
        let currentBundle:Bundle = Bundle(for:TDManager.self)
        
        guard
        
            let manager:DManager = DManager(bundle:currentBundle)
        
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
        let currentBundle:Bundle = Bundle(for:TDManager.self)
        
        guard
            
            let manager:DManager = DManager(bundle:currentBundle)
            
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
