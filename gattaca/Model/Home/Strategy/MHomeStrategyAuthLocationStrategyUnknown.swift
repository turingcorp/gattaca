import Foundation

class MHomeStrategyAuthLocationStrategyUnknown:MHomeStrategyAuthLocationStrategy
{
    override func nextStep()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.controller?.openAskAuthLocation()
        }
    }
}
