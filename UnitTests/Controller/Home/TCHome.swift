import XCTest
@testable import gattaca

class TCHome:XCTestCase
{
    private var session:MSession?
    private var controller:CHome?
    private let kWait:TimeInterval = 13
    private let kExpectation:TimeInterval = 15
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession()
        self.session = session
        
        let controller:CHome = CHome(session:session)
        controller.beginAppearanceTransition(true, animated:false)
        controller.endAppearanceTransition()
        self.controller = controller
    }
    
    func testSessionLoads()
    {
        let sessionExpectation:XCTestExpectation = expectation(
            description:"loaded session")
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).asyncAfter(
            deadline:DispatchTime.now() + kWait)
        {
            sessionExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kExpectation)
        { [weak self] (error:Error?) in
            
            guard
                
                let status:MSession.Status = self?.session?.status
                
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
    
    func testSessionModel()
    {
        let sessionExpectation:XCTestExpectation = expectation(
            description:"loaded session")
        
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).asyncAfter(
            deadline:DispatchTime.now() + kWait)
        {
            sessionExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kExpectation)
        { [weak self] (error:Error?) in
            
            let session:DSession? = self?.session?.session
            
            XCTAssertNotNil(
                session,
                "failed loading session from core data")
        }
    }
}
