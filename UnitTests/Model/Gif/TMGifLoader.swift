import XCTest
@testable import gattaca

class TMGifLoader:XCTestCase
{
    private var coreData:Database?
    private let kIdentifier:String = "lorem ipsum"
    private let kWaitExpectation:TimeInterval = 3
    
    override func setUp()
    {
        super.setUp()
        
        let bundle:Bundle = Bundle(for:TMGifLoader.self)
        coreData = Database(bundle:bundle)
    }
    
    //MARK: private
    
    private func createGif(completion:@escaping((DGif) -> ()))
    {
        guard
            
            let coreData:Database = self.coreData
            
        else
        {
            return
        }
        
        let identifier:String = kIdentifier
        
        coreData.create
        { (gif:DGif) in
            
            gif.initialValues(identifier:identifier)
            completion(gif)
        }
    }
    
    //MARK: internal
    
    func testLoad()
    {
        guard
            
            let coreData:Database = self.coreData
            
        else
        {
            return
        }
        
        let loadExpectation:XCTestExpectation = expectation(
            description:"load gifs")
        
        let gif:MGif = MGif()
        gif.load(coreData:coreData)
        {
            loadExpectation.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
        }
    }
    
    func testLoadCompleteAndMap()
    {
        let identifier:String = kIdentifier
        let gif:MGif = MGif()
        let loadExpectation:XCTestExpectation = expectation(
            description:"load and map")
        
        createGif
        { (item:DGif) in
            
            let items:[DGif] = [item]
            gif.loadComplete(gifs:items)
            {
                loadExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                gif.map[identifier],
                "failed mapping item")
        }
    }
    
    func testLoadCompleteStatusNew()
    {
        let gif:MGif = MGif()
        let loadExpectation:XCTestExpectation = expectation(
            description:"load gif new")
        
        createGif
        { (item:DGif) in
            
            item.status = DGif.Status.new
            
            let items:[DGif] = [item]
            gif.loadComplete(gifs:items)
            {
                loadExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            let firstItemNotReady:DGif? = gif.itemsNotReady.first
            let firstItemReady:DGif? = gif.itemsReady.first
            
            XCTAssertNotNil(
                firstItemNotReady,
                "failed grouping item")
            
            XCTAssertNil(
                firstItemReady,
                "grouped item wrongly")
        }
    }
    
    func testLoadCompleteStatusLoading()
    {
        let gif:MGif = MGif()
        let loadExpectation:XCTestExpectation = expectation(
            description:"load gif loading")
        
        createGif
        { (item:DGif) in
            
            item.status = DGif.Status.loading
            
            let items:[DGif] = [item]
            gif.loadComplete(gifs:items)
            {
                loadExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            let firstItemNotReady:DGif? = gif.itemsNotReady.first
            let firstItemReady:DGif? = gif.itemsReady.first
            
            XCTAssertNotNil(
                firstItemNotReady,
                "failed grouping item")
            
            XCTAssertNil(
                firstItemReady,
                "grouped item wrongly")
        }
    }
    
    func testLoadCompleteStatusReady()
    {
        let gif:MGif = MGif()
        let loadExpectation:XCTestExpectation = expectation(
            description:"load gif ready")
        
        createGif
        { (item:DGif) in
            
            item.status = DGif.Status.ready
            
            let items:[DGif] = [item]
            gif.loadComplete(gifs:items)
            {
                loadExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            let firstItemNotReady:DGif? = gif.itemsNotReady.first
            let firstItemReady:DGif? = gif.itemsReady.first
            
            XCTAssertNil(
                firstItemNotReady,
                "grouped item wrongly")
            
            XCTAssertNotNil(
                firstItemReady,
                "failed grouping item")
        }
    }
    
    func testLoadCompleteStatusMarked()
    {
        let gif:MGif = MGif()
        let loadExpectation:XCTestExpectation = expectation(
            description:"load gif marked")
        
        createGif
        { (item:DGif) in
            
            item.status = DGif.Status.marked
            
            let items:[DGif] = [item]
            gif.loadComplete(gifs:items)
            {
                loadExpectation.fulfill()
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            let firstItemNotReady:DGif? = gif.itemsNotReady.first
            let firstItemReady:DGif? = gif.itemsReady.first
            
            XCTAssertNil(
                firstItemNotReady,
                "grouped item wrongly")
            
            XCTAssertNil(
                firstItemReady,
                "grouped item wrongly")
        }
    }
}
