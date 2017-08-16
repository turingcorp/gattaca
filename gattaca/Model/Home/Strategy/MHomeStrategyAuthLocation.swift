import Foundation

class MHomeStrategyAuthLocation:MHomeStrategy
{
    override func nextStep()
    {
        controller?.model.session.load
            { [weak self] in
                
                self?.refreshStrategy()
        }
    }
}
