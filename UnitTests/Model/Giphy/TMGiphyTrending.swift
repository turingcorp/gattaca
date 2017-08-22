import XCTest
@testable import gattaca

class TMGiphyTrending:XCTestCase
{
    private let kOffset:Int = 0
    private let kLimit:Int = 10
    
    //MARK: internal
    
    func testFactoryUrl()
    {
        let url:URL? = MGiphy.factoryTrendingUrl(
            offset:kOffset,
            limit:kLimit)
        
        XCTAssertNotNil(
            url,
            "failed factorying url")
    }
    
    func testFactoryRequest()
    {
        let request:URLRequest? = MGiphy.factoryTrendingRequest(
            offset:kOffset,
            limit:kLimit)
        
        XCTAssertNotNil(
            request,
            "failed factorying request")
    }
}
