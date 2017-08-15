import XCTest
@testable import gattaca

class TFDatabase:XCTestCase
{
    private var database:FDatabase?
    private let kWaitExpectation:TimeInterval = 15
    
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
}
