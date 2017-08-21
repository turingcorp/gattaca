import XCTest
@testable import gattaca

class TMHomeRequest:XCTestCase
{
    private var trendingMock:Data?
    private var session:MSession?
    private var model:MHome?
    private var urlResponseOk:URLResponse?
    private var urlResponseFail:URLResponse?
    private let kDummyUrl:String = "https://www.google.com"
    private let kTrendingName:String = "giphyTrending"
    private let kTrendingExtension:String = "json"
    private let kStatusCodeOk:Int = 200
    private let kStatusCodeFail:Int = 0
    private let kMockedItems:Int = 3
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession()
        self.session = session
        
        model = MHome(session:session)
        
        guard
            
            let dummyUrl:URL = URL(string:kDummyUrl)
        
        else
        {
            return
        }
        
        urlResponseOk = HTTPURLResponse(
            url:dummyUrl,
            statusCode:kStatusCodeOk,
            httpVersion:nil,
            headerFields:nil)
        
        urlResponseFail = HTTPURLResponse(
            url:dummyUrl,
            statusCode:kStatusCodeFail,
            httpVersion:nil,
            headerFields:nil)
        
        let bundle:Bundle = Bundle(for:TMHomeRequest.self)
        
        guard
        
            let url:URL = bundle.url(
                forResource:kTrendingName,
                withExtension:kTrendingExtension)
        
        else
        {
            return
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
            return
        }
        
        trendingMock = data
    }
    
    //MARK: internal
    
    func testLoad()
    {
        XCTAssertNotNil(
            trendingMock,
            "failed loading mockup")
        
        XCTAssertNotNil(
            urlResponseOk,
            "failed creating url response ok")
        
        XCTAssertNotNil(
            urlResponseFail,
            "failed creating url response fail")
    }
    
    func testRequestGifsResponse()
    {
        guard
        
            let model:MHome = self.model
        
        else
        {
            return
        }
        
        let items:[MGiphyItem]? = model.requestGifsResponse(
            data:trendingMock,
            urlResponse:urlResponseOk,
            error:nil)
        
        XCTAssertNotNil(
            items,
            "failed parsing items")
        
        guard
        
            let parsedItems:[MGiphyItem] = items
        
        else
        {
            return
        }
        
        XCTAssertEqual(
            parsedItems.count,
            kMockedItems,
            "incorrect number of items")
        
        for item:MGiphyItem in parsedItems
        {
            let itemIdLength:Int = item.identifier.characters.count
            
            XCTAssertGreaterThan(
                itemIdLength,
                0,
                "failed parsing identifier")
        }
    }
    
    func testRequestGifsResponseFail()
    {
        guard
            
            let model:MHome = self.model
            
        else
        {
            return
        }
        
        let items:[MGiphyItem]? = model.requestGifsResponse(
            data:trendingMock,
            urlResponse:urlResponseFail,
            error:nil)
        
        XCTAssertNil(
            items,
            "should not parse items")
    }
}
