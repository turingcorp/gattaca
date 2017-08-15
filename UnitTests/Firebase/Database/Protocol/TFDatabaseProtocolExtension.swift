import XCTest
@testable import gattaca

class TFDatabaseProtocolExtension:XCTestCase
{
    private let kUserId:String = "lorem ipsum"
    private let kSlash:String = "/"
    
    func testPath()
    {
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        user.identifier = kUserId
        let syncstamp:FDatabaseUsersItemSyncstamp = FDatabaseUsersItemSyncstamp(
            user:user)
        
        guard
            
            let usersIdentifier:String = users.identifier,
            let syncstampIdentifier:String = syncstamp.identifier
        
        else
        {
            return
        }
        
        var expectedPath:String = usersIdentifier
        expectedPath.append(kSlash)
        expectedPath.append(kUserId)
        expectedPath.append(kSlash)
        expectedPath.append(syncstampIdentifier)
        
        let protocolPath:String = syncstamp.path
        
        XCTAssertEqual(
            expectedPath,
            protocolPath,
            "error generating path")
    }
}
