import XCTest
@testable import gattaca

class TFDatabaseUsersItemLocation:XCTestCase
{
    private var user:FDatabaseUsersItem?
    private let kUserId:String = "lorem ipsum"
    private let kCountryId:String = "banana republic"
    
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
        
        let location:FDatabaseUsersItemLocation? = FDatabaseUsersItemLocation(
            user:user,
            country:kCountryId)
        
        XCTAssertNil(
            location,
            "if user has no id there should be no location")
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
        
        let location:FDatabaseUsersItemLocation? = FDatabaseUsersItemLocation(
            user:user,
            country:kCountryId)
        
        XCTAssertNotNil(
            location,
            "failed creating location")
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
        
        let location:FDatabaseUsersItemLocation? = FDatabaseUsersItemLocation(
            user:user,
            country:kCountryId)
        
        XCTAssertEqual(
            location?.identifier,
            FDatabaseUsersItem.kKeyLocation,
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
        
        let location:FDatabaseUsersItemLocation? = FDatabaseUsersItemLocation(
            user:user,
            country:kCountryId)
        
        let json:Any? = location?.json
        
        XCTAssertNotNil(
            json,
            "failed creating json")
        
        let jsonMap:[String:Any]? = json as? [String:Any]
        
        XCTAssertNotNil(
            jsonMap,
            "json is not a dictionary")
        
        let jsonCountry:String? = jsonMap?[
            FDatabaseUsersItemLocation.kKeyCountry] as? String
        
        XCTAssertNotNil(
            jsonCountry,
            "json doesn't contain country")
        
        XCTAssertEqual(
            jsonCountry,
            kCountryId,
            "json country does not match")
    }
}
