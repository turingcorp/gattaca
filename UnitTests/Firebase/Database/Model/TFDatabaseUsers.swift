import XCTest
@testable import gattaca

class TFDatabaseUsers:XCTestCase
{
    private var users:FDatabaseUsers?
    
    override func setUp()
    {
        super.setUp()
        users = FDatabaseUsers()
    }
    
    //MARK: internal
    
    func testIdentifier()
    {
        XCTAssertNotNil(
            users,
            "failed to create users")
        
        XCTAssertNotNil(
            users?.identifier,
            "identifier is not set")
    }
    
    func testParent()
    {
        XCTAssertNil(
            users?.parent,
            "users should not have a parent")
    }
}
