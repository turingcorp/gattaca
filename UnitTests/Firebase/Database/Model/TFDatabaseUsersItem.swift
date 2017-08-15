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
}
