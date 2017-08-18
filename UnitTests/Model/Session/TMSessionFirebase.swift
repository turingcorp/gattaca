import XCTest
@testable import gattaca

class TMSessionFirebase:XCTestCase
{
    private var firebase:FDatabase?
    private var coreData:Database?
    private var session:DSession?
    private var modelSession:MSession?
    private let kUnknownId:String = "unknown_id"
    private let kWaitExpectation:TimeInterval = 15
    
    override func setUp()
    {
        super.setUp()
        
        let currentBundle:Bundle = Bundle(for:TMSessionFirebase.self)
        
        modelSession = MSession()
        firebase = FDatabase()
        coreData = Database(bundle:currentBundle)
        
        coreData?.create
        { [weak self] (session:DSession) in
            
            session.initialValues()
            self?.session = session
        }
    }
    
    //MARK: internal
    
    func testSync()
    {
        guard
            
            let coreData:Database = self.coreData,
            let session:DSession = self.session,
            let modelSession:MSession = self.modelSession
        
        else
        {
            return
        }
        
        let syncExpectation:XCTestExpectation = expectation(
            description:"sync firebase")
        
        modelSession.sync(
            coreData:coreData,
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
            
            let firebase:FDatabase = self.firebase,
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
            firebase:firebase,
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
            
            let firebase:FDatabase = self.firebase,
            let modelSession:MSession = self.modelSession,
            let userJson:Any = user.json
            
        else
        {
            return
        }
        
        let loadExpectation:XCTestExpectation = expectation(
            description:"load from firebase")
        
        let userId:String = firebase.create(
            parent:users,
            data:userJson)
        
        modelSession.loadFromFirebase(
            userId:userId,
            firebase:firebase,
            users:users)
        { (userLoaded:FDatabaseUsersItem) in
            
            firebase.load(
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
            
            let firebase:FDatabase = self.firebase,
            let modelSession:MSession = self.modelSession
            
        else
        {
            return
        }
        
        let loadExpectation:XCTestExpectation = expectation(
            description:"load from firebase")
        
        modelSession.loadFromFirebase(
            userId:kUnknownId,
            firebase:firebase,
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
    
    func testStatusUpdates()
    {
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        
        guard
            
            let firebase:FDatabase = self.firebase,
            let coreData:Database = self.coreData,
            let session:DSession = self.session,
            let modelSession:MSession = self.modelSession,
            let userJson:Any = user.json
        
        else
        {
            return
        }
        
        let userId:String = firebase.create(
            parent:users,
            data:userJson)
        user.identifier = userId
        session.userId = userId
        
        let status:DSession.Status = DSession.Status.banned
        
        guard
            
            let userStatus:FDatabaseUsersItemStatus = FDatabaseUsersItemStatus(
                user:user)
        
        else
        {
            return
        }
        
        userStatus.status = status
        
        firebase.update(model:userStatus)
        
        let syncExpectation:XCTestExpectation = expectation(
            description:"sync firebase")
        
        modelSession.sync(
            coreData:coreData,
            session:session)
        {
            syncExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            let sessionStatus:DSession.Status = session.status
            
            XCTAssertEqual(
                sessionStatus,
                status,
                "sync not updating stauts")
        }
    }
}
