import Foundation

class MHomeStrategyAuthLocationStrategyUnknown:MHomeStrategyAuthLocationStrategy
{
    override func nextStep()
    {
        controller?.openAskAuthLocation()
    }
}
