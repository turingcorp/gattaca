import XCTest
@testable import gattaca

class TFDatabaseUsersItemSyncstamp:XCTestCase
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
    
    //MARK: internal
    
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
        
        let syncstamp:FDatabaseUsersItemSyncstamp? = FDatabaseUsersItemSyncstamp(
            user:user)
        
        XCTAssertNil(
            syncstamp,
            "if user has no id there should be no syncstamp")
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
        
        let syncstamp:FDatabaseUsersItemSyncstamp? = FDatabaseUsersItemSyncstamp(
            user:user)
        
        XCTAssertNotNil(
            syncstamp,
            "failed creating syncstamp")
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
        
        let syncstamp:FDatabaseUsersItemSyncstamp? = FDatabaseUsersItemSyncstamp(
            user:user)
        
        XCTAssertEqual(
            syncstamp?.identifier,
            FDatabaseUsersItem.kKeySyncstamp,
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
        
        let timestamp:TimeInterval = Date().timeIntervalSince1970
        
        let syncstamp:FDatabaseUsersItemSyncstamp? = FDatabaseUsersItemSyncstamp(
            user:user)
        
        let json:Any? = syncstamp?.json
        
        XCTAssertNotNil(
            json,
            "failed creating json")
        
        let time:TimeInterval? = json as? TimeInterval
        
        XCTAssertNotNil(
            time,
            "json is not a time interval")
        
        guard
        
            let syncTime:TimeInterval = time
        
        else
        {
            return
        }
        
        XCTAssertGreaterThanOrEqual(
            syncTime,
            timestamp,
            "syncstamp is not current date/time")
    }
}
