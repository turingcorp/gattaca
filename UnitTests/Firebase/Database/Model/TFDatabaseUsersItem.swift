import XCTest
@testable import gattaca

class TFDatabaseUsersItem:XCTestCase
{
    private var user:FDatabaseUsersItem?
    private let kIdentifier:String = "lorem ipsum"
    
    override func setUp()
    {
        super.setUp()
        
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
        guard
        
            let user:FDatabaseUsersItem = self.user
        
        else
        {
            return
        }
        
        XCTAssertNil(
            user.identifier,
            "identifier should not be set")
        
        user.identifier = kIdentifier
        
        XCTAssertEqual(
            user.identifier,
            kIdentifier,
            "failed setting identifier")
    }
}
