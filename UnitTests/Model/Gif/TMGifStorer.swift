import XCTest
@testable import gattaca

class TMGifStorer:XCTestCase
{
    private let kIdentifier:String = "lorem ipsum"
    private let kWaitExpectation:TimeInterval = 4
    
    //MARK: private
    
    private func deleteAll(
        coreData:Database,
        completion:@escaping(() -> ()))
    {
        coreData.fetch
        { [weak self] (items:[DGif]) in
            
            self?.recursiveDelete(
                coreData:coreData,
                items:items,
                completion:completion)
        }
    }
    
    private func recursiveDelete(
        coreData:Database,
        items:[DGif],
        completion:@escaping(() -> ()))
    {
        var items:[DGif] = items
        
        guard
        
            let item:DGif = items.popLast()
        
        else
        {
            completion()
            return
        }
        
        coreData.delete(data:item)
        { [weak self] in
            
            self?.recursiveDelete(
                coreData:coreData,
                items:items,
                completion:completion)
        }
    }
    
    //MARK: internal
    
    func testStoreItems()
    {
        let bundle:Bundle = Bundle(for:TMGifStorer.self)
        
        guard
            
            let coreData:Database = Database(bundle:bundle)
        
        else
        {
            return
        }
        
        var items:[DGif]?
        let storeExpectation:XCTestExpectation = expectation(
            description:"store item expectation")
        
        let identifier:String = kIdentifier
        let giphyItem:MGiphyItem = MGiphyItem(
            identifier:identifier)
        let gif:MGif = MGif()
        
        deleteAll(coreData:coreData)
        {
            gif.storeItems(
                coreData:coreData,
                items:[giphyItem])
            {
                coreData.fetch
                { (fetchedItems:[DGif]) in
                    
                    items = fetchedItems
                    storeExpectation.fulfill()
                }
            }
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertNotNil(
                items,
                "failed storing items")

            XCTAssertEqual(
                items?.count,
                1,
                "amount stored don't match")
            
            XCTAssertEqual(
                items?.first?.identifier,
                identifier,
                "identifier doesn't match")
        }
    }
}
