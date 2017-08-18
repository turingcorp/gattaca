import XCTest
import CoreLocation
@testable import gattaca

class TMHomeStrategyAuthLocationStrategyFactory:XCTestCase
{
    private var session:MSession?
    private var controller:CHome?
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession()
        self.session = session
        
        let controller:CHome = CHome(session:session)
        self.controller = controller
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
        guard
            
            let controller:CHome = self.controller
        
        else
        {
            return
        }
        
        let status:CLAuthorizationStatus = CLAuthorizationStatus.authorizedAlways
        
        let strategy:MHomeStrategyAuthLocationStrategy? = MHomeStrategyAuthLocationStrategy.factoryStrategy(
            controller:controller,
            status:status)
        
        let strategyAuthAlways:MHomeStrategyAuthLocationStrategyGranted? = strategy as? MHomeStrategyAuthLocationStrategyGranted
        
        XCTAssertNotNil(
            strategyAuthAlways,
            "failed factory for auth always")
    }
    
    func testWhenInUser()
    {
        guard
            
            let controller:CHome = self.controller
            
        else
        {
            return
        }
        
        let status:CLAuthorizationStatus = CLAuthorizationStatus.authorizedWhenInUse
        
        let strategy:MHomeStrategyAuthLocationStrategy? = MHomeStrategyAuthLocationStrategy.factoryStrategy(
            controller:controller,
            status:status)
        
        let strategyWhenInUse:MHomeStrategyAuthLocationStrategyGranted? = strategy as? MHomeStrategyAuthLocationStrategyGranted
        
        XCTAssertNotNil(
            strategyWhenInUse,
            "failed factory for when in use")
    }
    
    func testNotDetermined()
    {
        guard
            
            let controller:CHome = self.controller
            
        else
        {
            return
        }
        
        let status:CLAuthorizationStatus = CLAuthorizationStatus.notDetermined
        
        let strategy:MHomeStrategyAuthLocationStrategy? = MHomeStrategyAuthLocationStrategy.factoryStrategy(
            controller:controller,
            status:status)
        
        let strategyNotDetermined:MHomeStrategyAuthLocationStrategyUnknown? = strategy as? MHomeStrategyAuthLocationStrategyUnknown
        
        XCTAssertNotNil(
            strategyNotDetermined,
            "failed factory for not determined")
    }
    
    func testRestricted()
    {
        guard
            
            let controller:CHome = self.controller
            
        else
        {
            return
        }
        
        let status:CLAuthorizationStatus = CLAuthorizationStatus.restricted
        
        let strategy:MHomeStrategyAuthLocationStrategy? = MHomeStrategyAuthLocationStrategy.factoryStrategy(
            controller:controller,
            status:status)
        
        let strategyRestricted:MHomeStrategyAuthLocationStrategyDenied? = strategy as? MHomeStrategyAuthLocationStrategyDenied
        
        XCTAssertNotNil(
            strategyRestricted,
            "failed factory for restricted")
    }
    
    func testDenied()
    {
        guard
            
            let controller:CHome = self.controller
            
        else
        {
            return
        }
        
        let status:CLAuthorizationStatus = CLAuthorizationStatus.denied
        
        let strategy:MHomeStrategyAuthLocationStrategy? = MHomeStrategyAuthLocationStrategy.factoryStrategy(
            controller:controller,
            status:status)
        
        let strategyDenied:MHomeStrategyAuthLocationStrategyDenied? = strategy as? MHomeStrategyAuthLocationStrategyDenied
        
        XCTAssertNotNil(
            strategyDenied,
            "failed factory for denied")
    }
}
