import XCTest
@testable import gattaca

class TFDatabaseCountries:XCTestCase
{
    private var countries:FDatabaseCountries?
    
    override func setUp()
    {
        super.setUp()
        countries = FDatabaseCountries()
    }
    
    //MARK: internal
    
    func testIdentifier()
    {
        XCTAssertNotNil(
            countries,
            "failed to create countries")
        
        XCTAssertNotNil(
            countries?.identifier,
            "identifier is not set")
    }
    
    func testParent()
    {
        XCTAssertNil(
            countries?.parent,
            "countries should not have a parent")
    }
}
