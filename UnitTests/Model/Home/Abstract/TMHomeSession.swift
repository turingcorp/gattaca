import XCTest
@testable import gattaca

class TMHomeSession:XCTestCase
{
    private var session:MSession?
    private var controller:CHome?
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession(status:MSession.Status.new)
        self.session = session
        controller = CHome(session:session)
    }
    
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
}
