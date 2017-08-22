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
    
    
}
