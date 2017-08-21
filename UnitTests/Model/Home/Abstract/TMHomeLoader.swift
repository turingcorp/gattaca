import XCTest
@testable import gattaca

class TMHomeLoader:XCTestCase
{
    private var session:MSession?
    private var model:MHome?
    private let kWaitExpectation:TimeInterval = 20
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession()
        self.session = session
        
        let model:MHome = MHome(session:session)
        self.model = model
    }
    
    //MARK: internal
    
    func testAsyncLoadItems()
    {
        guard
            
            let model:MHome = self.model
        
        else
        {
            return
        }
        
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
    
    func testLoadItemsDone()
    {
        guard
            
            let model:MHome = self.model
            
        else
        {
            return
        }
        
        var items:[MHomeItem]?
        
        let loadExpectation:XCTestExpectation = expectation(
            description:"load items")
        
        model.loadItemsDone
        { (loadedItems:[MHomeItem]) in
            
            items = loadedItems
            loadExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            
        }
    }
}
