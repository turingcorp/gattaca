import XCTest
@testable import gattaca

class TDSession:XCTestCase
{
    private let kUserId:String = "lorem ipsum"
    private let kCountry:String = "banana republic"
    private let kWaitExpectation:TimeInterval = 2
    
    //MARK: private
    
    private func updateData(session:DSession)
    {
        session.userId = kUserId
        session.country = kCountry
        session.status = DSession.Status.banned
        
        let model:MSession = MSession()
        model.updateSession(session:session)
        
        XCTAssertEqual(
            model.userId,
            kUserId,
            "failed assigning user id")
        
        XCTAssertEqual(
            model.country,
            kCountry,
            "failed assigning country")
        
        XCTAssertEqual(
            model.status,
            DSession.Status.banned,
            "failed assigning status")
    }
    
    //MARK: internal
    
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
    
    func testUpdateData()
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
        { [weak self] (error:Error?) in
            
            guard
                
                let session:DSession = session
                
            else
            {
                return
            }
            
            self?.updateData(session:session)
        }
    }
}
