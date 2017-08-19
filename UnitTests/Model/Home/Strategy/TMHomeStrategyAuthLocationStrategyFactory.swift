import XCTest
import CoreLocation
@testable import gattaca

class TMHomeStrategyAuthLocationStrategyFactory:XCTestCase
{
    private var session:MSession?
    private var controller:CHome?
    private var strategy:MHomeStrategyAuthLocation?
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession()
        self.session = session
        
        let controller:CHome = CHome(session:session)
        self.controller = controller
        
        strategy = MHomeStrategyAuthLocation(
            controller:controller)
    }
    
    //MARK: private
    
    private func factoryStrategy(status:CLAuthorizationStatus) -> MHomeStrategyAuthLocationStrategy?
    {
        guard
            
            let strategy:MHomeStrategyAuthLocation = self.strategy
            
        else
        {
            return nil
        }
        
        let model:MHomeStrategyAuthLocationStrategy? = MHomeStrategyAuthLocationStrategy.factoryStrategy(
            parentStrategy:strategy,
            status:status)
        
        return model
    }
    
    //MARK: internal
    
    func testController()
    {
        XCTAssertNotNil(
            controller,
            "failed controller init")
    }
    
    func testAuthAlways()
    {
        let status:CLAuthorizationStatus = CLAuthorizationStatus.authorizedAlways
        let strategy:MHomeStrategyAuthLocationStrategy? = factoryStrategy(status:status)
        
        let strategyAuthAlways:MHomeStrategyAuthLocationStrategyGranted? = strategy as? MHomeStrategyAuthLocationStrategyGranted
        
        XCTAssertNotNil(
            strategyAuthAlways,
            "failed factory for auth always")
    }
    
    func testWhenInUser()
    {
        let status:CLAuthorizationStatus = CLAuthorizationStatus.authorizedWhenInUse
        let strategy:MHomeStrategyAuthLocationStrategy? = factoryStrategy(status:status)
        
        let strategyWhenInUse:MHomeStrategyAuthLocationStrategyGranted? = strategy as? MHomeStrategyAuthLocationStrategyGranted
        
        XCTAssertNotNil(
            strategyWhenInUse,
            "failed factory for when in use")
    }
    
    func testNotDetermined()
    {
        let status:CLAuthorizationStatus = CLAuthorizationStatus.notDetermined
        let strategy:MHomeStrategyAuthLocationStrategy? = factoryStrategy(status:status)
        
        let strategyNotDetermined:MHomeStrategyAuthLocationStrategyUnknown? = strategy as? MHomeStrategyAuthLocationStrategyUnknown
        
        XCTAssertNotNil(
            strategyNotDetermined,
            "failed factory for not determined")
    }
    
    func testRestricted()
    {
        let status:CLAuthorizationStatus = CLAuthorizationStatus.restricted
        let strategy:MHomeStrategyAuthLocationStrategy? = factoryStrategy(status:status)
        
        let strategyRestricted:MHomeStrategyAuthLocationStrategyDenied? = strategy as? MHomeStrategyAuthLocationStrategyDenied
        
        XCTAssertNotNil(
            strategyRestricted,
            "failed factory for restricted")
    }
    
    func testDenied()
    {
        let status:CLAuthorizationStatus = CLAuthorizationStatus.denied
        let strategy:MHomeStrategyAuthLocationStrategy? = factoryStrategy(status:status)
        
        let strategyDenied:MHomeStrategyAuthLocationStrategyDenied? = strategy as? MHomeStrategyAuthLocationStrategyDenied
        
        XCTAssertNotNil(
            strategyDenied,
            "failed factory for denied")
    }
}
