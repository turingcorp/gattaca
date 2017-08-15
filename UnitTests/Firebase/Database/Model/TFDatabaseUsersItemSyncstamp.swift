import XCTest
@testable import gattaca

class TFDatabaseUsersItemSyncstamp:XCTestCase
{
    func testInitNoIdentifier()
    {
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        let syncstamp:FDatabaseUsersItemSyncstamp? = FDatabaseUsersItemSyncstamp(
            user:user)
        
        XCTAssertNil(
            syncstamp,
            "if user has no id there should be no syncstamp")
    }
}
