import Foundation

class MHomeStrategyAuthLocationStrategyGranted:MHomeStrategyAuthLocationStrategy
{
    override func nextStep()
    {
        super.nextStep()
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.strategy?.factoryDelegate()
        }
    }
}
