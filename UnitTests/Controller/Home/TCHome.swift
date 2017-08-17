import XCTest
@testable import gattaca

class TCHome:XCTestCase
{
    private weak var view:UIView?
    private var session:MSession?
    private var controller:CHome?
    private let kWait:TimeInterval = 2
    private let kExpectation:TimeInterval = 3
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession(status:MSession.Status.new)
        self.session = session
        
        let controller:CHome = CHome(session:session)
        view = controller.view
        self.controller = controller
    }
    
    //MARK: internal
    
    func testSessionLoads()
    {
        let sessionExpectation:XCTestExpectation = expectation(
            description:"loaded session")
        
        DispatchQueue.main.asyncAfter(
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
            
            XCTAssertNotEqual(
                status,
                MSession.Status.new,
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
            
            let data:MSessionData? = self?.session?.data
            
            XCTAssertNotNil(
                data,
                "failed loading session from core data")
        }
    }
}
