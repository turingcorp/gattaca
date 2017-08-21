import XCTest
@testable import gattaca

class TMHomeLoader:XCTestCase
{
    private var coreData:Database?
    private var session:MSession?
    private var model:MHome?
    private let kIdentifier:String = "lorem ipsum"
    private let kWaitExpectation:TimeInterval = 1
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession()
        self.session = session
        
        model = MHome(session:session)
        
        let bundle:Bundle = Bundle(for:TMHomeLoader.self)
        coreData = Database(bundle:bundle)
    }
    
    //MARK: internal
    
    func testLoadItemsDone()
    {
        guard
            
            let model:MHome = self.model,
            let coreData:Database = self.coreData
            
        else
        {
            return
        }
        
        var items:[MHomeItem]?
        
        let identifier:String = kIdentifier
        let loadExpectation:XCTestExpectation = expectation(
            description:"load items")
        
        coreData.create
        { (item:DGif) in
            
            item.initialValues(identifier:identifier)
            
            model.gif.itemsReady.append(item)
            model.loadItemsDone
            { (loadedItems:[MHomeItem]) in
                
                items = loadedItems
                loadExpectation.fulfill()
            }
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
                "failed loading items")
            
            guard
            
                let firstItem:MHomeItem = items?.first
            
            else
            {
                return
            }
            
            XCTAssertEqual(
                firstItem.gif?.identifier,
                identifier,
                "identifier doesn't match")
        }
    }
}
