import XCTest
@testable import gattaca

class TMGifLoader:XCTestCase
{
    private let kWaitExpectation:TimeInterval = 3
    
    //MARK: internal
    
    func testLoad()
    {
        let bundle:Bundle = Bundle(for:TMGifLoader.self)
        
        guard
            
            let coreData:Database = Database(bundle:bundle)
        
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
}
