import Foundation

class MHomeStrategyLoading:MHomeStrategy
{
    override func nextStep()
    {
        delayAndRefresh()
    }
}
