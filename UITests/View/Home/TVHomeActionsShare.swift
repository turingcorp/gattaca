import XCTest

class TVHomeActionsShare:XCTestCase
{
    override func setUp()
    {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testShareSheetAppears()
    {
        let app:XCUIApplication = XCUIApplication()
        
        XCTAssertFalse(
            app.sheets["Share"].exists,
            "share sheet should not be visible")
        
        if app.buttons["VHomeActionsShare_button"].exists
        {
            app.buttons["VHomeActionsShare_button"].tap()
            
            XCTAssertTrue(
                app.sheets["Share"].exists,
                "share sheet should appear")
        }
    }
}
