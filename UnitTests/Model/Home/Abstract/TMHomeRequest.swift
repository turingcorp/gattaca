import XCTest
@testable import gattaca

class TMHomeRequest:XCTestCase
{
    private var trendingMock:Data?
    private var session:MSession?
    private var model:MHome?
    private var urlResponseOk:URLResponse?
    private var urlResponseFail:URLResponse?
    private var requestError:Error?
    private let kDummyUrl:String = "https://www.google.com"
    private let kTrendingName:String = "giphyTrending"
    private let kTrendingExtension:String = "json"
    private let kErrorDomain:String = "some weird error"
    private let kIdentifier:String = "lorem ipsum"
    private let kDelayWait:TimeInterval = 1
    private let kWaitExpectation:TimeInterval = 2
    private let kStatusCodeOk:Int = 200
    private let kStatusCodeFail:Int = 0
    private let kMockedItems:Int = 3
    
    override func setUp()
    {
        super.setUp()
        
        let session:MSession = MSession()
        self.session = session
        
        model = MHome(session:session)
        
        requestError = NSError(
            domain:kErrorDomain,
            code:0,
            userInfo:nil)
        
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
        model?.coreData = Database(bundle:bundle)
        
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
        
        XCTAssertNotNil(
            requestError,
            "failed creating error")
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
    
    func testRequestGifsResponseError()
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
            error:requestError)
        
        XCTAssertNil(
            items,
            "should not parse items")
    }
    
    func testRequestGifsSuccess()
    {
        let identifier:String = kIdentifier
        let item:MGiphyItem = MGiphyItem(
            identifier:identifier)
        
        guard
            
            let model:MHome = self.model
            
        else
        {
            return
        }
        
        model.gif.strategyStand()
        
        let successWait:XCTestExpectation = expectation(
            description:"expectation success")
        
        model.requestGifsSuccess(items:[item])
        
        DispatchQueue.main.asyncAfter(
            deadline:DispatchTime.now() + kDelayWait)
        {
            successWait.fulfill()
        }
        
        waitForExpectations(timeout:kWaitExpectation)
        { (error:Error?) in
            
            XCTAssertEqual(
                model.gif.itemsNotReady.count,
                1,
                "there should be exactly 1 item store")
            
            XCTAssertEqual(
                model.gif.itemsNotReady.first?.identifier,
                identifier,
                "stored item doesn't match identifier")
            
            let strategy:MGifStrategyDownload? = model.gif.strategy as? MGifStrategyDownload
            
            XCTAssertNotNil(
                strategy,
                "strategy should be download")
        }
    }
}
