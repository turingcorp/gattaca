import XCTest
@testable import gattaca

class TMSessionLoader:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 3
    
    func testCreate()
    {
        let currentBundle:Bundle = Bundle(for:TDManager.self)
        let sessionExpectation:XCTestExpectation = expectation(
            description:"session created")
        
        guard
            
            let coreData:Database = Database(bundle:currentBundle)
        
        else
        {
            return
        }
        
        XCTAssertNotNil(
            coreData,
            "failed creating core data")
        
        let session:MSession = MSession()
        session.create(coreData:coreData)
        { (session:DSession) in
            
            sessionExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            let hasChanges:Bool = coreData.managedObjectContext.hasChanges
            
            XCTAssertFalse(
                hasChanges,
                "failed to save changes")
        }
    }
    
    func testLoad()
    {
        let currentBundle:Bundle = Bundle(for:TDManager.self)
        let sessionExpectation:XCTestExpectation = expectation(
            description:"session loaded")
        
        guard
            
            let coreData:Database = Database(bundle:currentBundle)
            
        else
        {
            return
        }
        
        XCTAssertNotNil(
            coreData,
            "failed creating coreData")
        
        let session:MSession = MSession()
        session.load(coreData:coreData)
        { (session:DSession) in
            
            sessionExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
        }
    }
}
