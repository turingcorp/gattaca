import XCTest
@testable import gattaca

class TFDatabaseCountriesItemUser:XCTestCase
{
    private var user:FDatabaseCountriesItemUser?
    private var syncstamp:TimeInterval?
    private let kIdentifier:String = "lorem ipsum"
    private let kCountry:String = "banana republic"
    private let kLatitude:Double = 1
    private let kLongitude:Double = 2
    
    override func setUp()
    {
        super.setUp()
        
        syncstamp = Date().timeIntervalSince1970
        let countries:FDatabaseCountries = FDatabaseCountries()
        let country:FDatabaseCountriesItem = FDatabaseCountriesItem(
            countries:countries,
            identifier:kCountry)
        user = FDatabaseCountriesItemUser(
            country:country,
            identifier:kIdentifier,
            latitude:kLatitude,
            longitude:kLongitude)
    }
    
    //MARK: private
    
    private func factoryJson() -> Any
    {
        let syncstamp:TimeInterval = Date().timeIntervalSince1970
        let json:[String:Any] = [
            FDatabaseCountriesItemUser.kKeyLatitude:kLatitude,
            FDatabaseCountriesItemUser.kKeyLongitude:kLongitude,
            FDatabaseCountriesItemUser.kKeySyncstamp:syncstamp]
        
        return json
    }
    
    //MARK: internal
    
    func testInit()
    {
        XCTAssertNotNil(
            user,
            "failed init user")
        
        XCTAssertNotNil(
            user?.parent,
            "parent should not be nil")
        
        XCTAssertEqual(
            user?.latitude,
            kLatitude,
            "failed assigning latitude")
        
        XCTAssertEqual(
            user?.longitude,
            kLongitude,
            "failed assigning longitude")
        
        guard
            
            let userSyncstamp:TimeInterval = user?.syncstamp,
            let initialSyncstamp:TimeInterval = syncstamp
        
        else
        {
            return
        }
        
        XCTAssertGreaterThanOrEqual(
            userSyncstamp,
            initialSyncstamp,
            "failed assigning syncstamp")
    }
    
    func testInitJson()
    {
        let json:Any = factoryJson()
        
        let user:FDatabaseCountriesItemUser? = FDatabaseCountriesItemUser(
            json:json)
        
        XCTAssertNotNil(
            user,
            "failed creating user from json")
        
        XCTAssertNil(
            user?.identifier,
            "identifier should be nil")
        
        XCTAssertNil(
            user?.parent,
            "parent should be nil")
        
        XCTAssertEqual(
            user?.latitude,
            kLatitude,
            "failed parsing latitude")
        
        XCTAssertEqual(
            user?.longitude,
            kLatitude,
            "failed parsing longitude")
        
        guard
            
            let userSyncstamp:TimeInterval = user?.syncstamp,
            let initialSyncstamp:TimeInterval = syncstamp
            
        else
        {
            return
        }
        
        XCTAssertGreaterThanOrEqual(
            userSyncstamp,
            initialSyncstamp,
            "failed parsing syncstamp")
    }
}
