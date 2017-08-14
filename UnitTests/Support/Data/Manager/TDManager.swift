import XCTest
import CoreData
@testable import gattaca

class TDManager:XCTestCase
{
    private var manager:DManager?
    private let kWaitExpectation:TimeInterval = 2
    
    override func setUp()
    {
        super.setUp()
        
        let currentBundle:Bundle = Bundle(for:TDManager.self)
        manager = DManager(bundle:currentBundle)
    }
    
    func testInit()
    {
        XCTAssertNotNil(
            manager,
            "failed to instance data manager")
    }
    
    func testDifferentCoordinators()
    {
        guard
        
            let managerProduction:DManager = DManager(bundle:nil)
        
        else
        {
            return
        }
        
        let pathProduction:String? = managerProduction.managedObjectContext.persistentStoreCoordinator?.persistentStores.first?.url?.path
        let pathTests:String? = manager?.managedObjectContext.persistentStoreCoordinator?.persistentStores.first?.url?.path
        
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
    
    func testCreate()
    {
        let createExpectation:XCTestExpectation = expectation(
            description:"core data create model")
        
        manager?.create(entity:DSession.self)
        { (data:NSManagedObject) in
            
            createExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
        }
    }
    
    func testSave()
    {
        let saveExpectation:XCTestExpectation = expectation(
            description:"core data save")
        
        manager?.create(entity:DSession.self)
        { [weak self] (data:NSManagedObject) in
            
            self?.manager?.save
            {
                saveExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { [weak self] (error:Error?) in
            
            guard
                
                let hasChanges:Bool = self?.manager?.managedObjectContext.hasChanges
            
            else
            {
                return
            }
            
            XCTAssertFalse(
                hasChanges,
                "failed to save core data")
        }
    }
}
