import XCTest
@testable import gattaca

class TFDatabaseProtocolExtension:XCTestCase
{
    private let kUserId:String = "lorem ipsum"
    private let kSlash:String = "/"
    private let kCountry:String = "banana republic"
    
    //MARK: internal
    
    func testPath()
    {
        let users:FDatabaseUsers = FDatabaseUsers()
        let user:FDatabaseUsersItem = FDatabaseUsersItem(
            users:users)
        user.identifier = kUserId
        
        guard
            
            let syncstamp:FDatabaseUsersItemSyncstamp = FDatabaseUsersItemSyncstamp(
                user:user),
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
    
    func testChild()
    {
        let countries:FDatabaseCountries = FDatabaseCountries()
        let country:FDatabaseCountriesItem = FDatabaseCountriesItem(
            countries:countries,
            identifier:kCountry)
        let child:String = country.child(identifier:kUserId)
        let childComponents:[String] = child.components(separatedBy:kSlash)
        let countComponenets:Int = childComponents.count
        
        XCTAssertEqual(
            countComponenets,
            3,
            "There should be 3 components on child name")
        
        let firstComponent:String = childComponents[0]
        
        XCTAssertEqual(
            firstComponent,
            countries.identifier,
            "first component mismatch")
        
        let secondComponent:String = childComponents[1]
        
        XCTAssertEqual(
            secondComponent,
            kCountry,
            "second component mismatch")
        
        let thirdComponent:String = childComponents[2]
        
        XCTAssertEqual(
            thirdComponent,
            kUserId,
            "third component mismatch")
    }
}
