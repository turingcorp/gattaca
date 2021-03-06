import XCTest
@testable import gattaca

class TFDatabase:XCTestCase
{
    private var firebase:FDatabase?
    private let kWaitExpectation:TimeInterval = 1
    private let kUserSyncstamp:TimeInterval = 9999
    
    override func setUp()
    {
        super.setUp()
        
        firebase = FDatabase()
    }
    
    //MARK: internal
    
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
        
        let userId:String? = firebase?.create(
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
        
        let userId:String? = firebase?.create(
            parent:users,
            data:data)
        
        let loadExpectation:XCTestExpectation = expectation(
            description:"load model")
        
        firebase?.load(
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
        
        let userId:String? = firebase?.create(
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
        
        firebase?.update(model:syncstamp)
        
        let loadExpectation:XCTestExpectation = expectation(
            description:"load model after update")
        
        firebase?.load(
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
    
    func testRemoveModel()
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
        
        let userId:String? = firebase?.create(
            parent:users,
            data:data)
        user.identifier = userId
        
        firebase?.remove(model:user)
        
        let removeExpectation:XCTestExpectation = expectation(
            description:"remove model")
        
        firebase?.load(
            parent:users,
            identifier:userId)
        { (loadedUser:FDatabaseUsersItem?) in
            
            firebaseUser = loadedUser
            
            removeExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNil(
                firebaseUser,
                "failed removing user")
        }
    }
    
    func testRemoveById()
    {
        var firebaseUser:FDatabaseUsersItem?
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        
        guard
            
            let data:Any = user.json,
            let userId:String = firebase?.create(
                parent:users,
                data:data)
            
        else
        {
            return
        }
        
        firebase?.remove(parent:users, identifier:userId)
        
        let removeExpectation:XCTestExpectation = expectation(
            description:"remove by id")
        
        firebase?.load(
            parent:users,
            identifier:userId)
        { (loadedUser:FDatabaseUsersItem?) in
            
            firebaseUser = loadedUser
            
            removeExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNil(
                firebaseUser,
                "failed removing user")
        }
    }
}
