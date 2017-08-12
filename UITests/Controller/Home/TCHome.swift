import XCTest

class TCHome:XCTestCase
{
    override func setUp()
    {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
}
