import XCTest
@testable import gattaca

class TMGifStrategyDownloadRequest:XCTestCase
{
    private var urlResponseOk:URLResponse?
    private var urlResponseFail:URLResponse?
    private var gif:MGif?
    private var strategy:MGifStrategyDownload?
    private var fileUrl:URL?
    private let kIdentifier:String = "xUNd9Cr6NMXPBO1t7y"
    private let kFileName:String = "giphyTrending"
    private let kFileExtension:String = "json"
    private let kStatusCodeOk:Int = 200
    private let kStatusCodeFail:Int = 0
    
    override func setUp()
    {
        super.setUp()
        
        let gif:MGif = MGif()
        self.gif = gif
        
        strategy = MGifStrategyDownload(
            model:gif)
        
        let bundle:Bundle = Bundle(for:TMHomeRequest.self)
        
        guard
            
            let fileUrl:URL = bundle.url(
                forResource:kFileName,
                withExtension:kFileExtension)
            
        else
        {
            return
        }
        
        self.fileUrl = fileUrl
        urlResponseOk = HTTPURLResponse(
            url:fileUrl,
            statusCode:kStatusCodeOk,
            httpVersion:nil,
            headerFields:nil)
        
        urlResponseFail = HTTPURLResponse(
            url:fileUrl,
            statusCode:kStatusCodeFail,
            httpVersion:nil,
            headerFields:nil)
    }
    
    //MARK: internal
    
    func testSetup()
    {
        XCTAssertNotNil(
            fileUrl,
            "failed creating url")
        
        XCTAssertNotNil(
            urlResponseOk,
            "failed creating response")
    }
    
    func testFactoryUrl()
    {
        let url:URL? = strategy?.factoryUrl(
            identifier:kIdentifier)
        
        XCTAssertNotNil(
            url,
            "failed factorying url")
    }
    
    func testDownloadedData()
    {
        let data:Data? = strategy?.downloadedData(
            fileUrl:fileUrl,
            urlResponse:urlResponseOk,
            error:nil)
        
        XCTAssertNotNil(
            data,
            "failed creating data")
    }
    
    func testDownloadedDataResponseFailed()
    {
        let data:Data? = strategy?.downloadedData(
            fileUrl:fileUrl,
            urlResponse:urlResponseFail,
            error:nil)
        
        XCTAssertNil(
            data,
            "data should not be created")
    }
    
    func testDownloadedDataError()
    {
        let error:Error = NSError(
            domain:kIdentifier,
            code:0,
            userInfo:nil)
        
        let data:Data? = strategy?.downloadedData(
            fileUrl:fileUrl,
            urlResponse:urlResponseOk,
            error:error)
        
        XCTAssertNil(
            data,
            "data should not be created")
    }
}
