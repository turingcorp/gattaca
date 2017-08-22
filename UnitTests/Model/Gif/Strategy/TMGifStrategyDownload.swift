import XCTest
@testable import gattaca

class TMGifStrategyDownload:XCTestCase
{
    //MARK: internal
    
    func testInit()
    {
        let gif:MGif = MGif()
        let strategy:MGifStrategyDownload? = MGifStrategyDownload(model:gif)
        
        XCTAssertNotNil(
            strategy,
            "failed loading strategy")
    }
}
