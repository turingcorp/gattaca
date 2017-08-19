import Foundation

class MHomeStrategyNew:MHomeStrategy
{
    override func nextStep()
    {
        super.nextStep()
        
        controller?.model.loadSession
        { [weak self] in
            
            self?.refreshStrategy()
        }
    }
}
