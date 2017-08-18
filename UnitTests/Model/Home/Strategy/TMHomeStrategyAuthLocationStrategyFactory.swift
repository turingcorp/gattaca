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
    
    /*
    
     let map:[CLAuthorizationStatus:MHomeStrategyAuthLocationStrategy.Type] = [
     CLAuthorizationStatus.authorizedAlways:MHomeStrategyAuthLocationStrategyGranted.self,
     CLAuthorizationStatus.authorizedWhenInUse:MHomeStrategyAuthLocationStrategyGranted.self,
     CLAuthorizationStatus.notDetermined:MHomeStrategyAuthLocationStrategyUnknown.self,
     CLAuthorizationStatus.restricted:MHomeStrategyAuthLocationStrategyDenied.self,
     CLAuthorizationStatus.denied:MHomeStrategyAuthLocationStrategyDenied.self]
     
    */
}
