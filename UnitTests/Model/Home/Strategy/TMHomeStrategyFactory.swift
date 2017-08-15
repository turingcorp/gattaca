import XCTest
@testable import gattaca

class TMHomeStrategyFactory:XCTestCase
{
    private var controller:CHome?
    private var session:MSession?
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession()
        self.session = session
        
        controller = CHome(session:session)
    }
    
    //MARK: internal
    
    func testInit()
    {
        XCTAssertNotNil(
            session,
            "failed to create session")
        
        XCTAssertNotNil(
            controller,
            "failed to create controller")
    }
    
    func testFactoryStrategyNew()
    {
        guard
            
            let controller:CHome = self.controller
        
        else
        {
            return
        }
        
        session?.status = MSession.Status.new
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategyNew:MHomeStrategyNew? = strategy as? MHomeStrategyNew
        
        XCTAssertNotNil(
            strategyNew,
            "failed loading strategy for status new")
    }
}
