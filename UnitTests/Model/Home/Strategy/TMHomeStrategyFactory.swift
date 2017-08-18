import XCTest
@testable import gattaca

class TMHomeStrategyFactory:XCTestCase
{
    //MARK: internal
    
    func testFactoryStrategyNew()
    {
        let session:MSession = MSession()
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
        let session:MSession = MSession()
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
        let session:MSession = MSession()
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
        let session:MSession = MSession()
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
        let session:MSession = MSession()
        let controller:CHome = CHome(session:session)
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategyAuthLocation:MHomeStrategyAuthLocation? = strategy as? MHomeStrategyAuthLocation
        
        XCTAssertNotNil(
            strategyAuthLocation,
            "failed loading strategy for auth location")
    }
    
    func testFactoryStrategyWaitingLocation()
    {
        let session:MSession = MSession()
        let controller:CHome = CHome(session:session)
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategyWaitingLocation:MHomeStrategyWaitingLocation? = strategy as? MHomeStrategyWaitingLocation
        
        XCTAssertNotNil(
            strategyWaitingLocation,
            "failed loading strategy waiting for location")
    }
    
    func testFactoryStrategySyncLocation()
    {
        let session:MSession = MSession()
        let controller:CHome = CHome(session:session)
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategySyncLocation:MHomeStrategySyncLocation? = strategy as? MHomeStrategySyncLocation
        
        XCTAssertNotNil(
            strategySyncLocation,
            "failed loading strategy sync location")
    }
    
    func testFactoryStrategyReady()
    {
        let session:MSession = MSession()
        let controller:CHome = CHome(session:session)
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategyReady:MHomeStrategyReady? = strategy as? MHomeStrategyReady
        
        XCTAssertNotNil(
            strategyReady,
            "failed loading strategy ready")
    }
}
