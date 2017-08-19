import Foundation

class MHomeStrategyAuthLocationStrategy
{
    private(set) weak var strategy:MHomeStrategyAuthLocation?
    
    required init(strategy:MHomeStrategyAuthLocation)
    {
        self.strategy = strategy
    }
    
    //MARK: internal
    
    func nextStep()
    {
        
    }
}
