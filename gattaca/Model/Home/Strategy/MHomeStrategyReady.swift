import Foundation

class MHomeStrategyReady:MHomeStrategy
{
    override func nextStep()
    {
        super.nextStep()
        
        controller?.sessionReady()
    }
}
