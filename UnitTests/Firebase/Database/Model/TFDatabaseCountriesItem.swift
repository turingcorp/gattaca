import XCTest
@testable import gattaca

class TFDatabaseCountriesItem:XCTestCase
{
    private let kCountry:String = "banana republic"
    
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
}
