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
}
