import XCTest
@testable import gattaca

class TMSessionFirebase:XCTestCase
{
    private var manager:DManager?
    private var session:DSession?
    private let kWaitExpectation:TimeInterval = 15
    
    override func setUp()
    {
        super.setUp()
        
        let currentBundle:Bundle = Bundle(for:TDManager.self)
        
        manager = DManager(bundle:currentBundle)
        manager?.create
        { [weak self] (session:DSession) in
            
            self?.session = session
        }
    }
}
