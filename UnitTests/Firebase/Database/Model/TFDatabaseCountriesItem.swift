import XCTest
@testable import gattaca

class TFDatabaseCountriesItem:XCTestCase
{
    private var country:FDatabaseCountriesItem?
    private let kCountry:String = "banana republic"
    
    override func setUp()
    {
        super.setUp()
        
        let countries:FDatabaseCountries = FDatabaseCountries()
        country = FDatabaseCountriesItem(
            countries:countries,
            identifier:kCountry)
    }
}
