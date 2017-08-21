import XCTest
@testable import gattaca

class TMGifDirectory:XCTestCase
{
    //MARK: internal
    
    func testCreateDirectory()
    {
        let directory:URL? = MGif.gifDirectory()
        
        XCTAssertNotNil(
            directory,
            "failed creating directory")
    }
}
