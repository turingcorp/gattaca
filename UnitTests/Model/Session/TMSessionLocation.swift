import XCTest
@testable import gattaca

class TMSessionLocation:XCTestCase
{
    private let kCountry:String = "banana republic"
    private let kLatitude:Double = 1
    private let kLongitude:Double = 2
    private let kWaitExpectation:TimeInterval = 15
    
    //MARK: internal
    
    func testSyncLocation()
    {
        let syncExpectation:XCTestExpectation = expectation(
            description:"sync location")
        
        let session:MSession = MSession()
        session.syncLocation(
            latitude:kLatitude,
            longitude:kLongitude,
            country:kCountry)
        {
            syncExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertEqual(
                session.status,
                MSession.Status.ready,
                "location not syncing")
        }
    }
}
