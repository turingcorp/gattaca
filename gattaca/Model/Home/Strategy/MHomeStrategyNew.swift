import Foundation

class MHomeStrategyNew:MHomeStrategy
{
    override func nextStep()
    {
        controller.model.session.load
        { [weak self] in
            
            self?.lastStep()
        }
    }
}
