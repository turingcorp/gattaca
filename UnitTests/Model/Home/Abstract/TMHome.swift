import XCTest
@testable import gattaca

class TMHome:XCTestCase
{
    private let kDelay:TimeInterval = 20
    private let kWaitExpectation:TimeInterval = 21
    
    //MARK: internal
    
    func testLoadItems()
    {
        let session:MSession = MSession()
        let model:MHome = MHome(session:session)
        
        model.loadItems()
        
        let loadExpectation:XCTestExpectation = expectation(
            description:"load items")
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now())
        {
            loadExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            let countItems:Int = model.items.count
            
            XCTAssertGreaterThan(
                countItems,
                0,
                "failed loading items")
        }
    }
}
