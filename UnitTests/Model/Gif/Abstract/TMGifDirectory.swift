import XCTest
@testable import gattaca

class TMGifDirectory:XCTestCase
{
    //MARK: internal
    
    func testDirectory()
    {
        let directory:URL? = MGif.directory()
        
        XCTAssertNotNil(
            directory,
            "failed referencing directory")
    }
    
    func testCreateDirectory()
    {
        let dir:URL? = MGif.createDirectory()
        
        XCTAssertNotNil(
            dir,
            "failed creating directory")
        
        guard
            
            let directory:URL = dir
        
        else
        {
            return
        }
        
        let resourceSets:Set<URLResourceKey> = Set<URLResourceKey>(
            [URLResourceKey.isExcludedFromBackupKey])
        let resourceValues:URLResourceValues
        
        do
        {
            try resourceValues = directory.resourceValues(forKeys:resourceSets)
        }
        catch
        {
            return
        }
        
        XCTAssertNotNil(
            resourceValues.isExcludedFromBackup,
            "exclude from backup key missing")
        
        guard
            
            let shouldExclude:Bool = resourceValues.isExcludedFromBackup
        
        else
        {
            return
        }
        
        XCTAssertTrue(
            shouldExclude,
            "directory not excluded from backup")
    }
}
