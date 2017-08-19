import XCTest
@testable import gattaca

class TMSessionLocation:XCTestCase
{
    private let kCountry:String = "banana republic"
    private let kLatitude:Double = 1
    private let kLongitude:Double = 2
    
    //MARK: internal
    
    func testSyncLocation()
    {
        let session:MSession = MSession()
        session.syncLocation(
            latitude:kLatitude,
            longitude:kLongitude,
            country:kCountry)
        {
            
        }
    }
}
