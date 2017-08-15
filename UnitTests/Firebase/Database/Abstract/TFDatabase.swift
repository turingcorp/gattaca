import XCTest
@testable import gattaca

class TFDatabase:XCTestCase
{
    private var database:FDatabase?
    private let kWaitExpectation:TimeInterval = 15
    private let kUserSyncstamp:TimeInterval = 9999
    
    override func setUp()
    {
        super.setUp()
        
        database = FDatabase()
    }
    
    func testCreate()
    {
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        
        guard
            
            let data:Any = user.json
        
        else
        {
            return
        }
        
        let userId:String? = database?.create(
            parent:users,
            data:data)
        
        XCTAssertNotNil(
            userId,
            "error creating model")
    }
    
    func testLoad()
    {
        var firebaseUser:FDatabaseUsersItem?
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        
        guard
            
            let data:Any = user.json
            
        else
        {
            return
        }
        
        let userId:String? = database?.create(
            parent:users,
            data:data)
        
        let loadExpectation:XCTestExpectation = expectation(
            description:"load model")
        
        database?.load(
            parent:users,
            identifier:userId)
        { (loadedUser:FDatabaseUsersItem?) in
            
            firebaseUser = loadedUser
            loadExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                firebaseUser,
                "failed loading user")
            
            XCTAssertNotNil(
                firebaseUser?.identifier,
                "user model has no id")
        }
    }
    
    func testUpdate()
    {
        var firebaseUser:FDatabaseUsersItem?
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        
        guard
            
            let data:Any = user.json
            
        else
        {
            return
        }
        
        let userId:String? = database?.create(
            parent:users,
            data:data)
        user.identifier = userId
        
        guard
            
            let syncstamp:FDatabaseUsersItemSyncstamp = FDatabaseUsersItemSyncstamp(
                user:user)
        
        else
        {
            return
        }
        
        syncstamp.syncstamp = kUserSyncstamp
        
        database?.update(model:syncstamp)
        
        let loadExpectation:XCTestExpectation = expectation(
            description:"load model after update")
        
        database?.load(
            parent:users,
            identifier:userId)
        { (loadedUser:FDatabaseUsersItem?) in
            
            firebaseUser = loadedUser
            loadExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { [weak self] (error:Error?) in
            
            XCTAssertNotNil(
                firebaseUser,
                "failed loading user")
            
            XCTAssertEqual(
                firebaseUser?.syncstamp,
                self?.kUserSyncstamp,
                "failed updating syncstamp")
        }
    }
}
