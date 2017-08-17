import Foundation

class MHomeStrategyLoaded:MHomeStrategy
{
    override func nextStep()
    {
        super.nextStep()
        
        controller?.sessionLoaded()
    }
}
