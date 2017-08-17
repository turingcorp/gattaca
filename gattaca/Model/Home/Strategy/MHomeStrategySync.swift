import Foundation

class MHomeStrategySync:MHomeStrategy
{
    override func nextStep()
    {
        super.nextStep()
        
        delayAndRefresh()
    }
}
