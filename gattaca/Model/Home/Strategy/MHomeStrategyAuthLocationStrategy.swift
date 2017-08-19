import Foundation

class MHomeStrategyAuthLocationStrategy
{
    private(set) weak var controller:CHome?
    private(set) weak var strategy:MHomeStrategyAuthLocation?
    
    required init(
        controller:CHome,
        strategy:MHomeStrategyAuthLocation)
    {
        self.controller = controller
        self.strategy = strategy
    }
    
    //MARK: internal
    
    func nextStep()
    {
        
    }
}
