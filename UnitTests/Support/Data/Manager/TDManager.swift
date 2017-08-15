import XCTest
@testable import gattaca

class TDManager:XCTestCase
{
    private var manager:DManager?
    private let kWaitExpectation:TimeInterval = 3
    
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
        
        manager?.create
        { (data:DSession) in
            
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
        
        manager?.create
        { [weak self] (data:DSession) in
            
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
    
    func testFetch()
    {
        let fetchExpectation:XCTestExpectation = expectation(
            description:"core data fetch model")
        
        manager?.fetch
        { (data:[DSession]) in
            
            fetchExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
        }
    }
    
    func testDelete()
    {
        let deleteExpectation:XCTestExpectation = expectation(
            description:"core data delete model")
        
        manager?.fetch
        { [weak self] (data:[DSession]) in
            
            guard
                
                let session:DSession = data.first
            
            else
            {
                deleteExpectation.fulfill()
                
                return
            }
            
            self?.manager?.delete(data:session)
            { [weak self] in
                
                self?.manager?.save
                {
                    deleteExpectation.fulfill()
                }
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
        }
    }
    
    func testCreateThenFetch()
    {
        let fetchExpectation:XCTestExpectation = expectation(
            description:"core data fetch model")
        var dataFetched:[DSession] = []
        
        deleteAllModels
        { [weak self] in
            
            self?.manager?.create
            { [weak self] (data:DSession) in
                
                self?.manager?.save
                { [weak self] in
                    
                    self?.manager?.fetch
                    { (data:[DSession]) in
                        
                        dataFetched = data
                        fetchExpectation.fulfill()
                    }
                }
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            let countDataFetched:Int = dataFetched.count
            
            XCTAssertEqual(
                countDataFetched,
                1,
                "fetch should return 1 element")
        }
    }
    
    func testCreateThenDelete()
    {
        let fetchExpectation:XCTestExpectation = expectation(
            description:"core data fetch model")
        var dataFetched:[DSession] = []
        
        deleteAllModels
        { [weak self] in
            
            self?.manager?.create
            { [weak self] (data:DSession) in
                
                self?.manager?.save
                { [weak self] in
                    
                    self?.manager?.fetch
                    { [weak self] (data:[DSession]) in
                        
                        guard
                            
                            let created:DSession = data.first
                        
                        else
                        {
                            return
                        }
                        
                        self?.manager?.delete(data:created)
                        { [weak self] in
                            
                            self?.manager?.save
                            { [weak self] in
                                
                                self?.manager?.fetch
                                { (data:[DSession]) in
                                    
                                    dataFetched = data
                                    fetchExpectation.fulfill()
                                }
                            }
                        }
                    }
                }
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            let countDataFetched:Int = dataFetched.count
            
            XCTAssertEqual(
                countDataFetched,
                0,
                "fetch should return NO elements")
        }
    }
    
    //MARK: private
    
    private func deleteAllModels(completion:@escaping(() -> ()))
    {
        manager?.fetch
        { [weak self] (data:[DSession]) in
            
            for dataItem:DSession in data
            {
                self?.manager?.delete(data:dataItem, completion:nil)
            }
            
            self?.manager?.save
            {
                completion()
            }
        }
    }
}
