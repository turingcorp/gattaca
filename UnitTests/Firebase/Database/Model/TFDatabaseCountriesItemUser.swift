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
}
