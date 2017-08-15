import XCTest
@testable import gattaca

class THomeFactory:XCTestCase
{
    private let kCountActions:Int = 3
    private let kIndexHate:Int = 0
    private let kIndexMeh:Int = 1
    private let kIndexLike:Int = 2
    
    //MARK: internal
    
    func testFactoryActions()
    {
        let actions:[MHomeActionProtocol] = MHome.factoryActions()
        let countActions:Int = actions.count
        
        XCTAssertEqual(
            countActions,
            kCountActions,
            "incorrect number of actions")
        
        if countActions == kCountActions
        {
            let actionHate:MHomeActionHate? = actions[kIndexHate] as? MHomeActionHate
            let actionMeh:MHomeActionMeh? = actions[kIndexMeh] as? MHomeActionMeh
            let actionLike:MHomeActionLike? = actions[kIndexLike] as? MHomeActionLike
            
            XCTAssertNotNil(
                actionHate,
                "action hate not found")
            
            XCTAssertNotNil(
                actionMeh,
                "action meh not found")
            
            XCTAssertNotNil(
                actionLike,
                "action like not found")
        }
    }
}
