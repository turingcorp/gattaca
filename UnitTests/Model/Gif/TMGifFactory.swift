import XCTest
@testable import gattaca

class TMGifFactory:XCTestCase
{
    private let kIdentifier:String = "lorem.ipsum"
    private let kSlash:String = "/"
    
    //MARK: internal
    
    func testFactoryPath()
    {
        guard
            
            let directory:URL = MGif.directory()
        
        else
        {
            return
        }
        
        let path:URL? = MGif.factoryPath(
            identifier:kIdentifier,
            directory:directory)
        
        XCTAssertNotNil(
            path,
            "failed factorying gif path")
        
        let pathString:String? = path?.path
        
        XCTAssertNotNil(
            pathString,
            "failed creating path string")
    }
}
