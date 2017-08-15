import XCTest
@testable import gattaca

class TFDatabaseUsersItem:XCTestCase
{
    private var user:FDatabaseUsersItem?
    private var timestamp:TimeInterval?
    private let kIdentifier:String = "lorem ipsum"
    private let kCreated:TimeInterval = 123
    private let kSyncstamp:TimeInterval = 456
    
    override func setUp()
    {
        super.setUp()
        
        timestamp = Date().timeIntervalSince1970
        
        let users:FDatabaseUsers = FDatabaseUsers()
        user = FDatabaseUsersItem(
            users:users)
    }
    
    //MARK: internal
    
    func testInit()
    {
        XCTAssertNotNil(
            user,
            "failed creating user")
    }
    
    func testIdentifier()
    {
        XCTAssertNil(
            user?.identifier,
            "identifier should not be set")
        
        user?.identifier = kIdentifier
        
        XCTAssertEqual(
            user?.identifier,
            kIdentifier,
            "failed setting identifier")
    }
    
    func testParent()
    {
        XCTAssertNotNil(
            user?.parent,
            "user should reference users as parent")
    }
    
    func testCreated()
    {
        guard
            
            let created:TimeInterval = user?.created,
            let timestamp:TimeInterval = self.timestamp
        
        else
        {
            XCTAssertNotNil(
                self.timestamp,
                "timestamp wasn't created")
            
            return
        }
        
        XCTAssertGreaterThanOrEqual(
            created,
            timestamp,
            "user created not being set properly")
    }
    
    func testSyncstamp()
    {
        guard
        
            let created:TimeInterval = user?.created,
            let syncstamp:TimeInterval = user?.syncstamp
        
        else
        {
            return
        }
        
        XCTAssertLessThanOrEqual(
            created,
            syncstamp,
            "error setting syncstamp")
    }
    
    func testStatus()
    {
        guard
        
            let rawStatus:Int16 = user?.status
        
        else
        {
            return
        }
        
        let status:DSession.Status? = DSession.Status(rawValue:rawStatus)
        
        XCTAssertNotNil(
            status,
            "invalid status")
    }
    
    func testJson()
    {
        let json:Any? = user?.json
        let jsonMap:[String:Any]? = json as? [String:Any]
        
        XCTAssertNotNil(
            json,
            "failed creating json")
        
        XCTAssertNotNil(
            jsonMap,
            "json is not a map")
        
        XCTAssertNotNil(
            jsonMap?[FDatabaseUsersItem.kKeyCreated],
            "json doesn't contain created")
        
        XCTAssertNotNil(
            jsonMap?[FDatabaseUsersItem.kKeySyncstamp],
            "json doesn't contain syncstamp")
        
        XCTAssertNotNil(
            jsonMap?[FDatabaseUsersItem.kKeyStatus],
            "json doesn't contain status")
    }
    
    func testInitJson()
    {
        let status:DSession.Status = DSession.Status.banned
        let json:[String:Any] = [
            FDatabaseUsersItem.kKeyCreated:kCreated,
            FDatabaseUsersItem.kKeySyncstamp:kSyncstamp,
            FDatabaseUsersItem.kKeyStatus:status.rawValue]
        
        let user:FDatabaseUsersItem? = FDatabaseUsersItem(
            json:json)
        
        XCTAssertNotNil(
            user,
            "failed creating user from json")
        
        XCTAssertEqual(
            user?.created,
            kCreated,
            "failed parsing created")
        
        XCTAssertEqual(
            user?.syncstamp,
            kSyncstamp,
            "failed parsing syncstamp")
        
        XCTAssertEqual(
            user?.status,
            status.rawValue,
            "failed parsing status")
    }
}
