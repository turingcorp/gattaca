import XCTest
@testable import gattaca

class TMHomeSession:XCTestCase
{
    private var session:MSession?
    private var controller:CHome?
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession()
        self.session = session
        controller = CHome(session:session)
    }
    
    //MARK: internal
    
    func testLoadStrategy()
    {
        guard
        
            let controller:CHome = self.controller
        
        else
        {
            return
        }
        
        XCTAssertNil(
            controller.model.strategy,
            "strategy should be nil at start")
        
        controller.model.loadStrategy(controller:controller)
        
        XCTAssertNotNil(
            controller.model.strategy,
            "strategy should be already loaded")
    }
    
    func testAuthLocation()
    {
        guard
        
            let controller:CHome = self.controller
        
        else
        {
            return
        }
        
        controller.model.authLocation(controller:controller)
        
        XCTAssertEqual(
            controller.model.status,
            MHome.Status.authLocation,
            "status should be auth location")
        
        let strategy:MHomeStrategyAuthLocation? = controller.model.strategy as? MHomeStrategyAuthLocation
        
        XCTAssertNotNil(
            strategy,
            "failed loading strategy")
    }
}
