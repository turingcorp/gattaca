import Foundation

class MHomeStrategyLoaded:MHomeStrategy
{
    override func nextStep()
    {
        controller?.sessionLoaded()
    }
}
