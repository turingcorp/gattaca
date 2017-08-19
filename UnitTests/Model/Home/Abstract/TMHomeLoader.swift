import XCTest
@testable import gattaca

class TMHomeLoader:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 20
    
    //MARK: internal
    
    func testAsyncLoadItems()
    {
        let session:MSession = MSession()
        let model:MHome = MHome(session:session)
        var items:[MHomeItem]?
        
        let loadExpectation:XCTestExpectation = expectation(
            description:"load items")
        
        model.asyncLoadItems
        { (loadedItems:[MHomeItem]) in
        
            items = loadedItems
            loadExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                items,
                "failed loading items")
            
            guard
                
                let count:Int = items?.count
            
            else
            {
                return
            }
            
            XCTAssertGreaterThan(
                count,
                0,
                "Zero loaded items")
        }
    }
}
