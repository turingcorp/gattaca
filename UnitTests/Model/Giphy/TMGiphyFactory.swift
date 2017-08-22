import XCTest
@testable import gattaca

class TMGiphyFactory:XCTestCase
{
    private let kTrendingName:String = "giphyTrending"
    private let kTrendingExtension:String = "json"
    private let kCountTrendingItems:Int = 3
    
    //MARK: private
    
    private func factoryTrendingJson() -> Any?
    {
        let bundle:Bundle = Bundle(for:TMHomeRequest.self)
        
        guard
            
            let url:URL = bundle.url(
                forResource:kTrendingName,
                withExtension:kTrendingExtension)
            
        else
        {
            return nil
        }
        
        let data:Data
        
        do
        {
            try data = Data(
                contentsOf:url,
                options:Data.ReadingOptions.uncached)
        }
        catch
        {
            return nil
        }
        
        let json:Any
        
        do
        {
            try json = JSONSerialization.jsonObject(
                with:data,
                options:JSONSerialization.ReadingOptions.allowFragments)
        }
        catch
        {
            return nil
        }
        
        return json
    }
    
    //MARK: internal
    
    func testFactoryItems()
    {
        let trendingJson:Any? = factoryTrendingJson()
        
        XCTAssertNotNil(
            trendingJson,
            "failed loading json")
        
        guard
        
            let json:Any = trendingJson
        
        else
        {
            return
        }
        
        let items:[MGiphyItem]? = MGiphy.factoryItems(json:json)
        
        XCTAssertNotNil(
            items,
            "failed factorying items")
        
        XCTAssertEqual(
            items?.count,
            kCountTrendingItems,
            "incorrect number of items")
        
        guard
        
            let parsedItems:[MGiphyItem] = items
        
        else
        {
            return
        }
        
        for item:MGiphyItem in parsedItems
        {
            let identifierLength:Int = item.identifier.characters.count
            
            XCTAssertGreaterThan(
                identifierLength,
                0,
                "failed parsing identifier")
        }
    }
}
