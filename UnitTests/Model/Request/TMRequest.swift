import XCTest
@testable import gattaca

class TMRequest:XCTestCase
{
    //MARK: private
    
    private func allRootKeys() -> [String]
    {
        let keys:[String] = [
            "app",
            "gif",
            "giphy"]
        
        return keys
    }
    
    //MARK: internal
    
    func testFactoryUrlMap()
    {
        let urlMap:[String:AnyObject]? = MRequest.factoryUrlMap()
        
        XCTAssertNotNil(
            urlMap,
            "failed loading url map")
    }
    
    func testUrlMapKeys()
    {
        let urlMap:[String:AnyObject]? = MRequest.factoryUrlMap()
        let allKeys:[String] = allRootKeys()
        
        for key:String in allKeys
        {
            XCTAssertNotNil(
                urlMap?[key],
                "key not found in map")
        }
    }
}
