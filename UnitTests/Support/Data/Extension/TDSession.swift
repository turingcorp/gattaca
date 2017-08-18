import XCTest
@testable import gattaca

class TDSession:XCTestCase
{
    func testInitialValues()
    {
        let timestamp:TimeInterval = Date().timeIntervalSince1970
        let session:DSession = DSession()
        session.initialValues()
        
        XCTAssertGreaterThanOrEqual(
            session.created,
            timestamp,
            "failed assigning initial values")
    }
}
