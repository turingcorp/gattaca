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
            kLongitude,
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
    
    func testJson()
    {
        let json:Any? = user?.json
        
        XCTAssertNotNil(
            json,
            "failed building json")
        
        let jsonMap:[String:Any]? = json as? [String:Any]
        
        XCTAssertNotNil(
            jsonMap,
            "json is not a json map")
        
        let latitude:Double? = jsonMap?[
            FDatabaseCountriesItemUser.kKeyLatitude] as? Double
        
        XCTAssertNotNil(
            latitude,
            "json doesn't contain latitude")
        
        XCTAssertEqual(
            latitude,
            kLatitude,
            "invalid latitude")
        
        let longitude:Double? = jsonMap?[
            FDatabaseCountriesItemUser.kKeyLongitude] as? Double
        
        XCTAssertNotNil(
            longitude,
            "json doesn't contain longitude")
        
        XCTAssertEqual(
            longitude,
            kLongitude,
            "invalid longitude")
        
        let syncstamp:TimeInterval? = jsonMap?[
            FDatabaseCountriesItemUser.kKeySyncstamp] as? TimeInterval
        
        XCTAssertNotNil(
            syncstamp,
            "json doesn't contain syncstamp")
        
        guard
            
            let userSyncstamp:TimeInterval = syncstamp,
            let initialSyncstamp:TimeInterval = self.syncstamp
            
        else
        {
            return
        }
        
        XCTAssertGreaterThanOrEqual(
            userSyncstamp,
            initialSyncstamp,
            "invalid syncstamp")
    }
}
