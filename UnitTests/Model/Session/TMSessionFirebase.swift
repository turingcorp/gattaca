import XCTest
@testable import gattaca

class TMSessionFirebase:XCTestCase
{
    private var database:FDatabase?
    private var manager:DManager?
    private var session:DSession?
    private var modelSession:MSession?
    private let kUnknownId:String = "unknown_id"
    private let kWaitExpectation:TimeInterval = 15
    
    override func setUp()
    {
        super.setUp()
        
        let currentBundle:Bundle = Bundle(for:TDManager.self)
        
        modelSession = MSession()
        database = FDatabase()
        manager = DManager(bundle:currentBundle)
        manager?.create
        { [weak self] (session:DSession) in
            
            session.initialValues()
            self?.session = session
        }
    }
    
    func testSync()
    {
        guard
            
            let manager:DManager = self.manager,
            let session:DSession = self.session,
            let modelSession:MSession = self.modelSession
        
        else
        {
            return
        }
        
        let syncExpectation:XCTestExpectation = expectation(
            description:"sync firebase")
        
        modelSession.sync(
            manager:manager,
            session:session)
        {
            syncExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                session.userId,
                "user id not loaded")
        }
    }
    
    func testCreateInFirebase()
    {
        guard
            
            let database:FDatabase = self.database,
            let modelSession:MSession = self.modelSession
            
        else
        {
            return
        }
        
        let users:FDatabaseUsers = FDatabaseUsers()
        let createExpectation:XCTestExpectation = expectation(
            description:"create in firebase")
        
        var firebaseUser:FDatabaseUsersItem?
        
        modelSession.createInFirebase(
            database:database,
            users:users)
        { (user:FDatabaseUsersItem) in
            
            firebaseUser = user
            createExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                firebaseUser,
                "failed loading user")
            
            XCTAssertNotNil(
                firebaseUser?.identifier,
                "user has no identifier")
        }
    }
    
    func testLoadFromFirebase()
    {
        var firebaseUser:FDatabaseUsersItem?
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        
        guard
            
            let database:FDatabase = self.database,
            let modelSession:MSession = self.modelSession,
            let userJson:Any = user.json
            
        else
        {
            return
        }
        
        let loadExpectation:XCTestExpectation = expectation(
            description:"load from firebase")
        
        let userId:String = database.create(
            parent:users,
            data:userJson)
        
        modelSession.loadFromFirebase(
            userId:userId,
            database:database,
            users:users)
        { (userLoaded:FDatabaseUsersItem) in
            
            database.load(
                parent:users,
                identifier:userId)
            { (retrieved:FDatabaseUsersItem?) in
                
                firebaseUser = retrieved
                loadExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                firebaseUser,
                "failed loading user")
            
            XCTAssertNotNil(
                firebaseUser?.identifier,
                "user has no identifier")
            
            guard
                
                let firebaseUser:FDatabaseUsersItem = firebaseUser
            
            else
            {
                return
            }
            
            XCTAssertGreaterThan(
                firebaseUser.syncstamp,
                user.syncstamp,
                "user syncstamp not updated")
        }
    }
    
    func testLoadUnknownId()
    {
        var firebaseUser:FDatabaseUsersItem?
        let users:FDatabaseUsers = FDatabaseUsers()
        
        guard
            
            let database:FDatabase = self.database,
            let modelSession:MSession = self.modelSession
            
        else
        {
            return
        }
        
        let loadExpectation:XCTestExpectation = expectation(
            description:"load from firebase")
        
        modelSession.loadFromFirebase(
            userId:kUnknownId,
            database:database,
            users:users)
        { (userLoaded:FDatabaseUsersItem) in
            
            firebaseUser = userLoaded
            loadExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                firebaseUser,
                "failed loading unknown id")
            
            XCTAssertNotNil(
                firebaseUser?.identifier,
                "user has no identifier")
        }
    }
}
