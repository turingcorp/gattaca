import XCTest
@testable import gattaca

class TMHomeStrategy:XCTestCase
{
    private var session:MSession?
    private var controller:CHome?
    private var strategy:MHomeStrategy?
    private let kAsyncWait:TimeInterval = 6
    private let kWaitExpectation:TimeInterval = 7
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession(
            status:MSession.Status.new)
        self.session = session
        
        let controller:CHome = CHome(session:session)
        self.controller = controller
        
        strategy = MHomeStrategyNew(controller:controller)
    }
    
    //MARK: internal
    
    func testInit()
    {
        XCTAssertNotNil(
            strategy,
            "failed init strategy")
    }
    
    func testRefreshStrategy()
    {
        guard
        
            let session:MSession = self.session,
            let strategy:MHomeStrategy = self.strategy
        
        else
        {
            return
        }
        
        session.status = MSession.Status.ready
        strategy.refreshStrategy()
        
        let newStrategy:MHomeStrategyReady? = controller?.model.strategy as? MHomeStrategyReady
        
        XCTAssertNotNil(
            newStrategy,
            "failed refreshing strategy")
    }
    
    func testDelayAndRefresh()
    {
        var newStrategy:MHomeStrategyReady?
        
        guard
            
            let session:MSession = self.session,
            let strategy:MHomeStrategy = self.strategy
            
        else
        {
            return
        }
        
        let refreshExpectation:XCTestExpectation = expectation(
            description:"refresh strategy")
        
        session.status = MSession.Status.ready
        strategy.delayAndRefresh()
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kAsyncWait)
        { [weak self] in
            
            refreshExpectation.fulfill()
            newStrategy = self?.controller?.model.strategy as? MHomeStrategyReady
        }
        
        let beforeDelayStrategy:MHomeStrategyReady? = controller?.model.strategy as? MHomeStrategyReady
        
        XCTAssertNil(
            beforeDelayStrategy,
            "refresh strategy didn't delay")
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                newStrategy,
                "failed delay refreshing strategy")
        }
    }
}
