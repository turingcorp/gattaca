import XCTest
@testable import gattaca

class TFDatabaseCountriesItem:XCTestCase
{
    private let kCountry:String = "banana republic"
    private let kUserA:String = "lorem"
    private let kUserB:String = "ipsum"
    private let kLatitude:Double = 1
    private let kLongitude:Double = 2
    private let kSyncstamp:TimeInterval = 3
    private let kTotalUsers:Int = 2
    
    //MARK: private
    
    private func factoryJson() -> Any
    {
        let userJson:[String:Any] = [
            FDatabaseCountriesItemUser.kKeyLatitude:kLatitude,
            FDatabaseCountriesItemUser.kKeyLongitude:kLongitude,
            FDatabaseCountriesItemUser.kKeySyncstamp:kSyncstamp]
        let json:[String:Any] = [
            kUserA:userJson,
            kUserB:userJson]
        
        return json
    }
    
    //MARK: internal
    
    func testInit()
    {
        let countries:FDatabaseCountries = FDatabaseCountries()
        let country:FDatabaseCountriesItem = FDatabaseCountriesItem(
            countries:countries,
            identifier:kCountry)
        
        XCTAssertNotNil(
            country.identifier,
            "identifier should not be nil")
        
        XCTAssertNotNil(
            country.parent,
            "parent should not be nil")
        
        XCTAssertLessThan(
            country.users.count,
            1,
            "there should not be users")
    }
    
    func testInitJson()
    {
        let json:Any = factoryJson()
        let country:FDatabaseCountriesItem? = FDatabaseCountriesItem(
            json:json)
        
        XCTAssertNotNil(
            country,
            "failed creating country from json")
        
        XCTAssertNil(
            country?.identifier,
            "country should have no identifier")
        
        XCTAssertNil(
            country?.parent,
            "country should have no parent")
        
        guard
            
            let model:FDatabaseCountriesItem = country
        
        else
        {
            return
        }
        
        let countUsers:Int = model.users.count
        
        XCTAssertEqual(
            countUsers,
            kTotalUsers,
            "failed parsing users")
        
        if countUsers == kTotalUsers
        {
            let userA:FDatabaseCountriesItemUser = model.users[0]
            
            XCTAssertEqual(
                userA.identifier,
                kUserA,
                "failed parsing user")
            
            let userB:FDatabaseCountriesItemUser = model.users[1]
            
            XCTAssertEqual(
                userB.identifier,
                kUserB,
                "failed parsing user")
        }
    }
}
