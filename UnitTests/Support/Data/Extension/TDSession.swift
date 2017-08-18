import XCTest
@testable import gattaca

class TDSession:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 2
    
    func testInitialValues()
    {
        var session:DSession?
        let timestamp:TimeInterval = Date().timeIntervalSince1970
        
        guard
            
            let database:Database = Database(bundle:nil)
        
        else
        {
            return
        }
        
        let createExpectation:XCTestExpectation = expectation(
            description:"core data create model")
        
        database.create
        { (model:DSession) in
            
            model.initialValues()
            session = model
            createExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                session,
                "failed creating session")
            
            guard
                
                let session:DSession = session
            
            else
            {
                return
            }
            
            XCTAssertGreaterThanOrEqual(
                session.created,
                timestamp,
                "failed assigning initial values")
        }
    }
    
    func testStatus()
    {
        var session:DSession?
        
        guard
            
            let database:Database = Database(bundle:nil)
            
        else
        {
            return
        }
        
        let createExpectation:XCTestExpectation = expectation(
            description:"core data create model")
        
        database.create
        { (model:DSession) in
            
            session = model
            createExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            guard
                
                let session:DSession = session
                
            else
            {
                return
            }
            
            session.status = DSession.Status.banned
            
            XCTAssertEqual(
                session.rawStatus,
                DSession.Status.banned.rawValue,
                "failed assigning raw status")
            
            session.rawStatus = DSession.Status.active.rawValue
            
            XCTAssertEqual(
                session.status,
                DSession.Status.active,
                "failed assigning status")
        }
    }
}
