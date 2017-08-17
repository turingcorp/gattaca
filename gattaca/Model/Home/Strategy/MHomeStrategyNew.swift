import Foundation

class MHomeStrategyNew:MHomeStrategy
{
    override func nextStep()
    {
        super.nextStep()
        
        controller?.model.session.load
        { [weak self] in
            
            self?.refreshStrategy()
        }
    }
}
