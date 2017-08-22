import XCTest
@testable import gattaca

class TMGiphyRandom:XCTestCase
{
    //MARK: internal
    
    func testFactoryUrl()
    {
        let url:URL? = MGiphy.factoryRandomUrl()
        
        XCTAssertNotNil(
            url,
            "failed factorying url")
    }
    
    func testFactoryRequest()
    {
        let request:URLRequest? = MGiphy.factoryRandomRequest()
        
        XCTAssertNotNil(
            request,
            "failed factorying request")
    }
}
