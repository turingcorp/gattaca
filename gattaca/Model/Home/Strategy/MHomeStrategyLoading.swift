import Foundation

class MHomeStrategyLoading:MHomeStrategy
{
    override func nextStep()
    {
        super.nextStep()
        
        delayAndRefresh()
    }
}
