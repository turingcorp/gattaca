import XCTest
@testable import gattaca

class TDManager:XCTestCase
{
    func testInit()
    {
        let manager:DManager? = DManager()
        
        XCTAssertNotNil(
            manager,
            "failed to instance data manager")
    }
}
