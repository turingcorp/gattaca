import XCTest
@testable import gattaca

class TMGifOrganizer:XCTestCase
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
    
    func testNewItem()
    {
        guard
            
            let coreData:Database = self.coreData
        
        else
        {
            return
        }
        
        let addExpectation:XCTestExpectation = expectation(
            description:"add item expection")
        let identifier:String = kIdentifier
        
        coreData.create
        { [weak self] (item:DGif) in
            
            item.initialValues(identifier:identifier)
            self?.model?.gif.newItem(item:item)
            addExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { [weak self] (error:Error?) in
            
            guard
            
                let gif:MGif = self?.model?.gif
            
            else
            {
                return
            }
            
            XCTAssertEqual(
                gif.itemsNotReady.count,
                1,
                "failed adding item to not ready")
            
            let storedItem:DGif? = gif.map[identifier]
            
            XCTAssertNotNil(
                storedItem,
                "failed mapping item")
        }
    }
}
