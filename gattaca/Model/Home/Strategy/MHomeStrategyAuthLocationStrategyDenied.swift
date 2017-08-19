import Foundation

class MHomeStrategyAuthLocationStrategyDenied:MHomeStrategyAuthLocationStrategy
{
    override func nextStep()
    {
        super.nextStep()
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.strategy?.controller?.openAskDeniedLocation()
        }
    }
}
