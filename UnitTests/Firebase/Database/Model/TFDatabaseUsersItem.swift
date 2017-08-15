import XCTest
@testable import gattaca

class TFDatabaseUsersItem:XCTestCase
{
    private var user:FDatabaseUsersItem?
    private var timestamp:TimeInterval?
    private let kIdentifier:String = "lorem ipsum"
    
    override func setUp()
    {
        super.setUp()
        
        timestamp = Date().timeIntervalSince1970
        
        let users:FDatabaseUsers = FDatabaseUsers()
        user = FDatabaseUsersItem(
            users:users)
    }
    
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
}
