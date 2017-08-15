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
    
    func testFactoryStrategyLoading()
    {
        guard
            
            let controller:CHome = self.controller
            
        else
        {
            return
        }
        
        session?.status = MSession.Status.loading
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategyLoading:MHomeStrategyLoading? = strategy as? MHomeStrategyLoading
        
        XCTAssertNotNil(
            strategyLoading,
            "failed loading strategy for status loading")
    }
    
    func testFactoryStrategySync()
    {
        guard
            
            let controller:CHome = self.controller
            
        else
        {
            return
        }
        
        session?.status = MSession.Status.sync
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategySync:MHomeStrategySync? = strategy as? MHomeStrategySync
        
        XCTAssertNotNil(
            strategySync,
            "failed loading strategy for status sync")
    }
    
    func testFactoryStrategyLoaded()
    {
        guard
            
            let controller:CHome = self.controller
            
        else
        {
            return
        }
        
        session?.status = MSession.Status.loaded
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategyLoaded:MHomeStrategyLoaded? = strategy as? MHomeStrategyLoaded
        
        XCTAssertNotNil(
            strategyLoaded,
            "failed loading strategy for status loaded")
    }
}
