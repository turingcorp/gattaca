import XCTest
@testable import gattaca

class TMHomeStrategyFactory:XCTestCase
{
    //MARK: internal
    
    func testFactoryStrategyNew()
    {
        let session:MSession = MSession(status:MSession.Status.new)
        let controller:CHome = CHome(session:session)
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategyNew:MHomeStrategyNew? = strategy as? MHomeStrategyNew
        
        XCTAssertNotNil(
            strategyNew,
            "failed loading strategy for status new")
    }
    
    func testFactoryStrategyLoading()
    {
        let session:MSession = MSession(status:MSession.Status.loading)
        let controller:CHome = CHome(session:session)
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategyLoading:MHomeStrategyLoading? = strategy as? MHomeStrategyLoading
        
        XCTAssertNotNil(
            strategyLoading,
            "failed loading strategy for status loading")
    }
    
    func testFactoryStrategySync()
    {
        let session:MSession = MSession(status:MSession.Status.sync)
        let controller:CHome = CHome(session:session)
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategySync:MHomeStrategySync? = strategy as? MHomeStrategySync
        
        XCTAssertNotNil(
            strategySync,
            "failed loading strategy for status sync")
    }
    
    func testFactoryStrategyLoaded()
    {
        let session:MSession = MSession(status:MSession.Status.loaded)
        let controller:CHome = CHome(session:session)
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategyLoaded:MHomeStrategyLoaded? = strategy as? MHomeStrategyLoaded
        
        XCTAssertNotNil(
            strategyLoaded,
            "failed loading strategy for status loaded")
    }
    
    func testFactoryStrategyAuthLocation()
    {
        let session:MSession = MSession(status:MSession.Status.authLocation)
        let controller:CHome = CHome(session:session)
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategyLoaded:MHomeStrategyAuthLocation? = strategy as? MHomeStrategyAuthLocation
        
        XCTAssertNotNil(
            strategyLoaded,
            "failed loading strategy for auth location")
    }
}
