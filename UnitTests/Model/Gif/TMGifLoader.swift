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
            description:"load gifs")
        
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
}
