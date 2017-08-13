import XCTest
@testable import gattaca

class TCHome:XCTestCase
{
    private var session:MSession?
    private var controller:CHome?
    private let kWaitSession:UInt32 = 3
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession()
        self.session = session
        controller = CHome(session:session)
    }
    
    func testSessionLoads()
    {
        sleep(kWaitSession)
        
        guard
            
            let status:MSession.Status = session?.status
            
        else
        {
            return
        }
        
        XCTAssertEqual(
            status,
            MSession.Status.loaded,
            "session is not being loaded")
    }
}
