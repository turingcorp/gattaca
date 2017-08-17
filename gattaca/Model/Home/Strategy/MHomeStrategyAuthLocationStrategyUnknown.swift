import Foundation

class MHomeStrategyAuthLocationStrategyUnknown:MHomeStrategyAuthLocationStrategy
{
    override func nextStep()
    {
        super.nextStep()
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.controller?.openAskAuthLocation()
        }
    }
}
