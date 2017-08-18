import XCTest
@testable import gattaca

class TMHomeStrategy:XCTestCase
{
    private var session:MSession?
    private var controller:CHome?
    private var strategy:MHomeStrategy?
    
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
}
