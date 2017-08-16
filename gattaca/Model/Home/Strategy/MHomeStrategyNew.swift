import Foundation

class MHomeStrategyNew:MHomeStrategy
{
    override func nextStep()
    {
        controller.model.session.load
        { [weak self] in
            
            guard
                
                let controller:CHome = self?.controller
                
            else
            {
                return
            }
            
            self?.controller.model.loadStrategy(
                controller:controller)
        }
    }
}
