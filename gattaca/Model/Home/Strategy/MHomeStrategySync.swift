import Foundation

class MHomeStrategySync:MHomeStrategy
{
    override func nextStep()
    {
        delayAndRefresh()
    }
}
