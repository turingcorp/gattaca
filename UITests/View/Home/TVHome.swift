import XCTest

class TVHome:XCTestCase
{
    private let kValidOrientation:UIInterfaceOrientation = UIInterfaceOrientation.portrait
    
    override func setUp()
    {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    //MARK: private
    
    private func validateOrientation()
    {
        let currentOrientation:UIInterfaceOrientation = UIApplication.shared.statusBarOrientation
        
        XCTAssertEqual(
            currentOrientation,
            kValidOrientation,
            "error maintaining valid orientation")
    }
    
    //MARK: internal
    
    func testNoOrientationChange()
    {
        XCUIDevice.shared().orientation = UIDeviceOrientation.portrait
        validateOrientation()
        
        XCUIDevice.shared().orientation = UIDeviceOrientation.landscapeLeft
        validateOrientation()
        
        XCUIDevice.shared().orientation = UIDeviceOrientation.landscapeRight
        validateOrientation()
        
        XCUIDevice.shared().orientation = UIDeviceOrientation.portraitUpsideDown
        validateOrientation()
        
        XCUIDevice.shared().orientation = UIDeviceOrientation.faceUp
        validateOrientation()
        
        XCUIDevice.shared().orientation = UIDeviceOrientation.faceDown
        validateOrientation()
    }
}
