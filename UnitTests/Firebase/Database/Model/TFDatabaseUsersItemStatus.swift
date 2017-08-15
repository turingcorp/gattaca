import XCTest
@testable import gattaca

class TFDatabaseUsersItemStatus:XCTestCase
{
    private var user:FDatabaseUsersItem?
    private let kUserId:String = "lorem ipsum"
    
    override func setUp()
    {
        super.setUp()
        
        let users:FDatabaseUsers = FDatabaseUsers()
        user = FDatabaseUsersItem(
            users:users)
    }
    
    func testUserIsCreated()
    {
        XCTAssertNotNil(
            user,
            "failed creating user")
    }
    
    func testInitNoIdentifier()
    {
        guard
            
            let user:FDatabaseUsersItem = self.user
            
        else
        {
            return
        }
        
        let status:FDatabaseUsersItemStatus? = FDatabaseUsersItemStatus(
            user:user)
        
        XCTAssertNil(
            status,
            "if user has no id there should be no status")
    }
    
    func testInitIdentifier()
    {
        guard
            
            let user:FDatabaseUsersItem = self.user
            
        else
        {
            return
        }
        
        user.identifier = kUserId
        
        let status:FDatabaseUsersItemStatus? = FDatabaseUsersItemStatus(
            user:user)
        
        XCTAssertNotNil(
            status,
            "failed creating status")
    }
    
    func testIdentifier()
    {
        guard
            
            let user:FDatabaseUsersItem = self.user
            
        else
        {
            return
        }
        
        user.identifier = kUserId
        
        let status:FDatabaseUsersItemStatus? = FDatabaseUsersItemStatus(
            user:user)
        
        XCTAssertEqual(
            status?.identifier,
            FDatabaseUsersItem.kKeyStatus,
            "identifier doesn't match user property")
    }
    
    func testJson()
    {
        guard
            
            let user:FDatabaseUsersItem = self.user
            
        else
        {
            return
        }
        
        user.identifier = kUserId
        
        let statusBanned:DSession.Status = DSession.Status.banned
        let status:FDatabaseUsersItemStatus? = FDatabaseUsersItemStatus(
            user:user)
        status?.rawStatus = statusBanned.rawValue
        
        let json:Any? = status?.json
        
        XCTAssertNotNil(
            json,
            "failed creating json")
        
        let rawStatus:Int16? = json as? Int16
        
        XCTAssertNotNil(
            rawStatus,
            "json is not an Int16")
        
        XCTAssertEqual(
            rawStatus,
            statusBanned.rawValue,
            "status doesn't match set value")
    }
    
    func testValueChange()
    {
        guard
            
            let user:FDatabaseUsersItem = self.user
            
        else
        {
            return
        }
        
        user.identifier = kUserId
        
        let testStatus:DSession.Status = DSession.Status.banned
        let status:FDatabaseUsersItemStatus? = FDatabaseUsersItemStatus(
            user:user)
        status?.status = testStatus
        
        XCTAssertEqual(
            status?.status,
            testStatus,
            "failed assigning status")
        
        XCTAssertEqual(
            status?.rawStatus,
            testStatus.rawValue,
            "failed assigning status raw value")
    }
}
