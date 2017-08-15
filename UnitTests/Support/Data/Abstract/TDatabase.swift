import XCTest
@testable import gattaca

class TDatabase:XCTestCase
{
    private var coreData:Database?
    private let kWaitExpectation:TimeInterval = 3
    
    override func setUp()
    {
        super.setUp()
        
        let currentBundle:Bundle = Bundle(for:TDatabase.self)
        coreData = Database(bundle:currentBundle)
    }
    
    func testInit()
    {
        XCTAssertNotNil(
            coreData,
            "failed to instance data manager")
    }
    
    func testDifferentCoordinators()
    {
        guard
            
            let coreDataProduction:Database = Database(bundle:nil)
            
        else
        {
            return
        }
        
        let pathProduction:String? = coreDataProduction.managedObjectContext.persistentStoreCoordinator?.persistentStores.first?.url?.path
        let pathTests:String? = coreData?.managedObjectContext.persistentStoreCoordinator?.persistentStores.first?.url?.path
        
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
        
        coreData?.create
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
        
        coreData?.create
        { [weak self] (session:DSession) in
            
            session.initialValues()
            
            self?.coreData?.save
            {
                saveExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { [weak self] (error:Error?) in
            
            guard
                
                let hasChanges:Bool = self?.coreData?.managedObjectContext.hasChanges
                
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
        
        coreData?.fetch
        { (session:[DSession]) in
            
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
        
        coreData?.fetch
        { [weak self] (data:[DSession]) in
            
            guard
                
                let session:DSession = data.first
                
            else
            {
                deleteExpectation.fulfill()
                
                return
            }
            
            self?.coreData?.delete(data:session)
            { [weak self] in
                
                self?.coreData?.save
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
            
            self?.coreData?.create
            { [weak self] (session:DSession) in
                
                session.initialValues()
                
                self?.coreData?.save
                { [weak self] in
                    
                    self?.coreData?.fetch
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
            
            self?.coreData?.create
            { [weak self] (session:DSession) in
                
                session.initialValues()
                
                self?.coreData?.save
                { [weak self] in
                    
                    self?.coreData?.fetch
                    { [weak self] (data:[DSession]) in
                        
                        guard
                            
                            let created:DSession = data.first
                            
                        else
                        {
                            return
                        }
                        
                        self?.coreData?.delete(data:created)
                        { [weak self] in
                            
                            self?.coreData?.save
                            { [weak self] in
                                
                                self?.coreData?.fetch
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
        coreData?.fetch
        { [weak self] (data:[DSession]) in
            
            for dataItem:DSession in data
            {
                self?.manager?.delete(data:dataItem, completion:nil)
            }
            
            self?.coreData?.save
            {
                completion()
            }
        }
    }
}
