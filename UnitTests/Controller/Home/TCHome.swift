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
        
        let session:MSession = MSession()
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
                
                let status:MHome.Status = self?.controller?.model.status
                
            else
            {
                return
            }
            
            XCTAssertNotEqual(
                status,
                MHome.Status.new,
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
            
            let userId:String? = self?.session?.userId
            
            XCTAssertNotNil(
                userId,
                "failed loading session from core data")
        }
    }
}
