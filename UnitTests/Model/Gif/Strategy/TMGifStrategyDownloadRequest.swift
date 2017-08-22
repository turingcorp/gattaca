import XCTest
@testable import gattaca

class TMGifStrategyDownloadRequest:XCTestCase
{
    private let kIdentifier:String = "xUNd9Cr6NMXPBO1t7y"
    
    //MARK: internal
    
    func testFactoryUrl()
    {
        let gif:MGif = MGif()
        
        guard
        
            let strategy:MGifStrategyDownload = MGifStrategyDownload(
                model:gif)
        
        else
        {
            return
        }
        
        let url:URL? = strategy.factoryUrl(
            identifier:kIdentifier)
        
        XCTAssertNotNil(
            url,
            "failed factorying url")
    }
}
