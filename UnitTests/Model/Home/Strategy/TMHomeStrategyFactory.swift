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
    
    func testFactoryStrategyAuthLocation()
    {
        let session:MSession = MSession()
        let controller:CHome = CHome(session:session)
        controller.model.status = MHome.Status.authLocation
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategyAuthLocation:MHomeStrategyAuthLocation? = strategy as? MHomeStrategyAuthLocation
        
        XCTAssertNotNil(
            strategyAuthLocation,
            "failed loading strategy for auth location")
    }
    
    func testFactoryStrategyReady()
    {
        let session:MSession = MSession()
        let controller:CHome = CHome(session:session)
        controller.model.status = MHome.Status.ready
        
        let strategy:MHomeStrategy? = MHomeStrategy.factoryStrategy(
            controller:controller)
        let strategyReady:MHomeStrategyReady? = strategy as? MHomeStrategyReady
        
        XCTAssertNotNil(
            strategyReady,
            "failed loading strategy ready")
    }
}
