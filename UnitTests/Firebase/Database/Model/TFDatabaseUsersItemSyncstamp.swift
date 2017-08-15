import XCTest
@testable import gattaca

class TFDatabaseUsersItemSyncstamp:XCTestCase
{
    private let kUserId:String = "lorem ipsum"
    
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
    
    func testInitIdentifier()
    {
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        user.identifier = kUserId
        let syncstamp:FDatabaseUsersItemSyncstamp? = FDatabaseUsersItemSyncstamp(
            user:user)
        
        XCTAssertNotNil(
            syncstamp,
            "failed creating syncstamp")
    }
    
    func testIdentifier()
    {
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        user.identifier = kUserId
        let syncstamp:FDatabaseUsersItemSyncstamp? = FDatabaseUsersItemSyncstamp(
            user:user)
        
        XCTAssertEqual(
            syncstamp?.identifier,
            FDatabaseUsersItem.kKeySyncstamp,
            "identifier doesn't match user property")
    }
}
